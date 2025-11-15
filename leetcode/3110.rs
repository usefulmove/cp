fn main() {
    fn score_of_string(s: String) -> i32 {
        let cs: Vec<char> = s.chars().collect();

        fn recur(cs: Vec<char>, acc: i32) -> i32 {
           if cs.len() < 2_usize { return acc; } 

           recur( // recursive call
               cs[1..].to_vec(),
               acc + (cs[0] as i32 - cs[1] as i32).abs()
           )
        }

        recur(cs, 0)
    }

    println!("{}", score_of_string("hello".to_string())); // => 13
    println!("{}", score_of_string("zaz".to_string()));   // => 50
}
