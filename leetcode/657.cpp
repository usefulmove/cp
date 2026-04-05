class Solution {
  public:
    bool judgeCircle(string moves) {
        int x = 0;
        int y = 0;

        for (auto c : moves) {
            if (c == 'U') { y += 1; }
            else if (c == 'D') { y -= 1; }
            else if (c == 'L') { x -= 1; }
            else if (c == 'R') { x += 1; }
        }

        return (x == 0) && (y == 0);
    }
};
