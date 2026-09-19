impl Solution {
    pub fn can_construct(ransom_note: String, magazine: String) -> bool {
        let rans = ransom_note.chars().collect::<Vec<char>>();
        let mut mag = magazine.chars().collect::<Vec<char>>();
        mag.sort();
        
        for i in 0..rans.len() {
            if !mag.contains(&rans[i]) { return false }
            
            /* remove entry from mag */
            if let Ok(ind) = mag.binary_search(&rans[i]) {
                mag.remove(ind);
            }
        }
        
        true
    }
}
