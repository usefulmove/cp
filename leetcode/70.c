int climbStairs(int n){
    int fib(int n, int a, int b) {
        if (n == 0) {
            return a;
        } else if ( n == 1 ) {
            return b;
        } else {
            return fib(n-1, b, a + b);
        }
    }
  
    return fib(n+1, 0, 1);
}
