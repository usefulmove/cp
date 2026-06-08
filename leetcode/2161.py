class Solution:
    def pivotArray(self, nums: List[int], pivot: int) -> List[int]:
        ls, es, ms = [], [], []

        for n in nums:
            if n < pivot:
                ls.append(n)
            elif n == pivot:
                es.append(n)
            else:
                ms.append(n)

        return ls + es + ms
