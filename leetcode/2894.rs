impl Solution {
    pub fn difference_of_sums(n: i32, m: i32) -> i32 {
        fn recur(n: i32, non: i32, div: i32, m: i32) -> i32 {
            if n == 0 {
                return non - div;
            }

            if n % m == 0 {
                return recur(n - 1, non, div + n, m);
            }

            return recur(n - 1, non + n, div, m);
        }

        recur(n, 0, 0, m)
    }
}
