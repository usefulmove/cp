class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        groups: Dict[str, List[str]] = {}

        for s in strs:
            sorted_s = "".join(sorted(s))

            if sorted_s in groups:
                groups[sorted_s] = groups[sorted_s] + [s]
            else:
                groups[sorted_s] = [s]

        return list(groups.values())
