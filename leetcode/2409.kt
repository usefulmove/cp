typealias Date = String

class Solution {
    fun countDaysTogether(
        arriveAlice: Date,
        leaveAlice: Date,
        arriveBob: Date,
        leaveBob: Date,
    ): Int {
        val arriveAliceDayOfYear = dayOfYear(arriveAlice)
        val arriveBobDayOfYear = dayOfYear(arriveBob)
        val leaveAliceDayOfYear = dayOfYear(leaveAlice)
        val leaveBobDayOfYear = dayOfYear(leaveBob)
        var count = 0
        for (day in 1..365) {
            if ((day >= arriveAliceDayOfYear) &&
                (day >= arriveBobDayOfYear) &&
                (day <= leaveAliceDayOfYear) &&
                (day <= leaveBobDayOfYear))
                    count += 1
        }
        return count
    }
    fun day(date: Date): Int = date.slice(3..4).toInt()
    fun month(date: Date): Int = date.slice(0..1).toInt()
    fun dayOfYear(date: Date): Int {
        val monthDays = listOf(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
        var days = 0
        for (month in 1..<month(date))
            days += monthDays[month - 1]
        return days + day(date)
    }
}
