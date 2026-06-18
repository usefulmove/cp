impl Solution {
    pub fn angle_clock(hour: i32, minutes: i32) -> f64 {
        let mang = 6. * minutes as f64;
        let hang = 30. * (hour % 12) as f64 + mang / 12.;
        
        let diff = hang - mang;
        
        diff.abs().min(360.-diff.abs())
    }
}
