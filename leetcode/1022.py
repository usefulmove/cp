# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def sumRootToLeaf(self, root: Optional[TreeNode]) -> int:
        bins = []

        def recur(node: Optional[TreeNode], path: str = "") -> None:
            if node.left:
                recur(node.left, path + str(node.val))

            if node.right:
                recur(node.right, path + str(node.val))

            if not node.right and not node.left:
                bins.append(path + str(node.val))
        
        recur(root)

        return sum(int(b, 2) for b in bins)
