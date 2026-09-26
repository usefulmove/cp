class Solution {
    fun secondsBetweenTimes(startTime: String, endTime: String): Int =
        calculateSeconds(endTime) - calculateSeconds(startTime)

    fun calculateSeconds(time: String): Int {
        val hh = time.slice(0..1).toInt()
        val mm = time.slice(3..4).toInt()
        val ss = time.slice(6..7).toInt()
        return hh * 3600 + mm * 60 + ss
    }
}
