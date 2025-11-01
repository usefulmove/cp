# definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def modifiedList(self, nums: List[int], head: Optional[ListNode]) -> Optional[ListNode]:
        nset = set(nums)

        def recurse(node: Optional[ListNode], prev_node: Optional[ListNode]) -> None:
            nonlocal head

            if not node:
                return

            if node.val in nset:
                if not prev_node:
                    head = node.next
                    recurse(head, None)
                elif node.next:
                    prev_node.next = node.next
                    recurse(node.next, prev_node)
                else:
                    prev_node.next = None
            else:
                recurse(node.next, node)

        recurse(head, None)

        return head
