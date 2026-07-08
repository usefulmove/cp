class Solution:
    def scoreValidator(self, events: list[str]) -> list[int]:
        def recur(es, score = 0, counter = 0):
            if not es or counter == 10:
                return [score, counter]
            event, *rest = es
            match event:
                case "0" | "1" | "2" | "3" | "4" | "6":
                    return recur(rest, score + int(event), counter)
                case "W":
                    return recur(rest, score, counter + 1)
                case "WD" | "NB":
                    return recur(rest, score + 1, counter)
        return recur(events)
