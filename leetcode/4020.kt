class Solution {
    fun elevatorRequests(n: Int, requests: IntArray): Int {
        tailrec fun loop(
            reqs: List<Int>,
            time: Int = 0,
            position: Int = 0
        ): Int =
            if (reqs.isEmpty())
                time
            else
                loop(
                    reqs.drop(1),
                    time + abs(reqs.first() - position),
                    reqs.first()
                )
        return loop(requests.toList())
    }
}
