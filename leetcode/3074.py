class Solution:
    def minimumBoxes(self, apple: List[int], capacity: List[int]) -> int:
        def f(n: int, box: List[int], cnt: int = 0) -> int:
            match n, box:
                case 0, _:
                    return cnt
                case n, [cap, *box_rest] if n >= cap:
                    return f(n-cap, box_rest, cnt+1)
                case _, _:
                    return f(0, [], cnt+1)

        return f(sum(apple), sorted(capacity, reverse=True))
