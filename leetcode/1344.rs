impl Solution {
    pub fn angle_clock(hour: i32, minutes: i32) -> f64 {
        let min_ang = 6. * minutes as f64;
        let hour_ang = 30. * (hour % 12) as f64 + min_ang / 12.;
        let diff = (hour_ang - min_ang).abs();
        
        diff.min(360. - diff)
    }
}
