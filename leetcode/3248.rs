fn main() {
    fn final_position_of_snake(n: i32, commands: Vec<String>) -> i32 {
        let f = |pos: i32, cmd: &String| -> i32 {
            pos + match &cmd[..] {
                "UP" => -n,
                "DOWN" => n,
                "RIGHT" => 1,
                "LEFT" => -1,
                _ => 0,
            }
        };

        commands.iter().fold(0, f)
    }

    println!("{}", final_position_of_snake(2, vec![String::from("RIGHT"), String::from("DOWN")])); // => 3
}
