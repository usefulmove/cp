class Solution:
    def earliestTime(self, tasks: List[List[int]], minTime: int=10000) -> int:
        if not tasks:
            return minTime
        return self.earliestTime(tasks[1:], min(minTime, tasks[0][0]+tasks[0][1]))
