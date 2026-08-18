class Solution:
    def elevatorRequests(self, n: int, requests: list[int]) -> int:
        pos = time = 0

        for req in requests:
            time += abs(req - pos)
            pos = req
        
        return time
