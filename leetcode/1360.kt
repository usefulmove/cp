typealias Date = String // "YYYY-MM-DD"

class Solution {
    fun daysBetweenDates(date1: Date, date2: Date): Int {
        val res =
            if (dateToYear(date1) == dateToYear(date2))
                abs(dateToDayOfYear(date2) - dateToDayOfYear(date1))
            else {
                val dateStart: Date
                val dateEnd: Date
                if (dateToOrdinal(date2) > dateToOrdinal(date1)) {
                    dateStart = date1
                    dateEnd = date2
                } else {
                    dateStart = date2
                    dateEnd = date1
                }
                val endOfFirstYear =
                    daysInYear(dateToYear(dateStart)) - dateToDayOfYear(dateStart)
                val daysOfYearsBetween =
                    ((dateToYear(dateStart) + 1)..(dateToYear(dateEnd) - 1))
                        .fold(0) { acc, year -> acc + daysInYear(year) }
                val startOfLastYear = dateToDayOfYear(dateEnd)
                return endOfFirstYear + daysOfYearsBetween + startOfLastYear
            }

        return res
    }

    fun dateToDayOfYear(date: Date): Int {
        // TODO
        val monthDays = listOf(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
        var days = 0
        for (month in 1..<dateToMonth(date))
            days += monthDays[month - 1]
        return days + dateToDay(date)
    }

    fun daysInMonth(month: Int, year: Int): Int {
        val monthDays = listOf(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31) // TODO: rename

        // TODO
        return monthDays[month - 1]
    }

    fun dateToYear(date: Date): Int = date.slice(0..3).toInt()

    fun dateToMonth(date: Date): Int = date.slice(5..6).toInt()

    fun dateToDay(date: Date): Int = date.slice(8..9).toInt()

    fun daysInYear(year: Int): Int =
        (1..12).fold(0) { acc, month -> acc + daysInMonth(month, year) }

    fun dateToOrdinal(date: Date): Int =
        dateToYear(date) * 365 + dateToDayOfYear(date)

}
