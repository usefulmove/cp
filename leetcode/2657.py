class Solution:
  def findThePrefixCommonArray(self, A: List[int], B: List[int]) -> List[int]:
    def ncommons(seta, setb):
      return len(seta.intersection(setb))
    return [ncommons(set(A[:i+1]), set(B[:i+1])) for i, _ in enumerate(A)]
