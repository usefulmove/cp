class Solution {
  public:
    double angleClock(int hour, int minutes) {
        double min_ang = 6. * double(minutes);
        double hour_ang = 30. * double(hour % 12) + min_ang / 12.;
        double diff = std::abs(hour_ang - min_ang);
        return std::min(diff, 360. - diff);
    }
};
