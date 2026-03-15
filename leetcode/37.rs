use std::collections::HashSet;

impl Solution {
    pub fn solve_sudoku(puz: &mut Vec<Vec<char>>) {
        // convert the character board to u8 board
        let mut board: [[u8; 9]; 9] = [[0; 9]; 9];
        for i in 0..9 {
            for j in 0..9 {
                board[i][j] = match puz[i][j].to_digit(10 as u32) {
                    Some(value) => value as u8,
                    None        => 0,
                };
            }
        }
        
        // solve board
        solve(&mut board);
        
        // update puzzle passed in at mutable reference
        for i in 0..9 {
            for j in 0..9 {
                puz[i][j] = match std::char::from_digit(board[i][j] as u32, 10 as u32) {
                    Some(c) => c,
                    None    => '.',
                }
            }
        }
        
        //println!("{:?}", puz);
    }
}

#[derive(PartialEq, Eq)]
enum Group {
    A, B, C, D, E, F, G, H, I
}

fn is_possible(board: &[[u8; 9]; 9], n: u8, a: usize, b: usize) -> bool {
    let mut column_set: Set = Set::new();
    let mut row_set: Set = Set::new();
    let mut group_set: Set = Set::new();

    // build sets
    for i in 0..9 {
        for j in 0..9 {
            // ignore empty cells
            if board[i][j] == 0 { continue; }

            // check column
            if j == b {
                column_set.insert(board[i][j]);
            }

            // check row
            if i == a {
                row_set.insert(board[i][j]);
            }

            // check group
            if get_group(&board, i, j) == get_group(&board, a, b) {
                group_set.insert(board[i][j]);
            }
        }
    }

    // check for solution ( set comparison )
    let complete_set: Set = Set::from([1, 2, 3, 4, 5, 6, 7, 8, 9]);
    let check_set: Set = column_set
    .union(&row_set)
    .cloned()
    .collect::<Set>()
    .union(&group_set)
    .cloned()
    .collect::<Set>();

    let possible: Vec<&u8> = complete_set.difference(&check_set).collect::<Vec<&u8>>();

    if possible.contains(&&n) { true } else { false }
}

/* recursive solver */
fn solve(board: &mut [[u8; 9]; 9]) {
    for i in 0..9 {
        for j in 0..9 {
            if board[i][j] == 0 {
                for test_val in 1..10 {
                    if is_possible(&board, test_val, i, j) {
                        board[i][j] = test_val;
                        solve(board);
                        if is_solved(&board) { return; }
                        board[i][j] = 0; // reset current cell to 0
                    }
                }
                return;
            }
        }
    }
}


fn is_solved(board: &[[u8; 9]; 9]) -> bool {
    for i in 0..9 {
        for j in 0..9 {
            if board[i][j] == 0 {
                return false;
            }
        }
    }
    true
}

fn get_group(board: &[[u8; 9]; 9], a: usize, b: usize) -> Group {
    match (a, b) {
        (0..=2, 0..=2) => Group::A,
        (0..=2, 3..=5) => Group::B,
        (0..=2, 6..=8) => Group::C,
        (3..=5, 0..=2) => Group::D,
        (3..=5, 3..=5) => Group::E,
        (3..=5, 6..=8) => Group::F,
        (6..=8, 0..=2) => Group::G,
        (6..=8, 3..=5) => Group::H,
        (6..=8, 6..=8) => Group::I,
        _ => panic!("invalid group"),
    }
}

type Set = HashSet<u8>;
