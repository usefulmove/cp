impl Solution {
    pub fn check_zero_ones(s: String) -> bool {
        let longest = |sep| s.split(sep).map(str::len).max();
        longest('0') > longest('1')
    }
}


//impl Solution {
//    pub fn check_zero_ones(s: String) -> bool {
//        let ones = s.split('0').collect();
//        let zeros = s.split('1').collect();
//
//        let longest_segment = |segments: Vec<&str>| -> usize {
//            segments
//                .into_iter()
//                .fold(0, |acc, segment| { segment.len().max(acc) })
//        };
//
//        longest_segment(ones) > longest_segment(zeros)
//    }
//}


//impl Solution {
//    pub fn check_zero_ones(s: String) -> bool {
//        let ones = s.split('0');
//        let zeros = s.split('1');
//
//        let mut longest_ones = 0;
//        for segment in ones {
//            if segment.len() > longest_ones {
//                longest_ones = segment.len();
//            }
//        }
//
//        let mut longest_zeros = 0;
//        for segment in zeros {
//            if segment.len() > longest_zeros {
//                longest_zeros = segment.len();
//            }
//        }
//
//        longest_ones > longest_zeros
//    }
//}
