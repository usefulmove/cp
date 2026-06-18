class Solution {
  public:
    double angleClock(int hour, int minutes) {
        float min_ang = 6. * float(minutes);
        float hour_ang = 30. * float(hour % 12) + min_ang / 12.;
        float diff = std::abs(hour_ang - min_ang);
        return (diff < 180.) ? diff : 360. - diff;
    }
};
