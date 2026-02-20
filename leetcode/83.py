# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def deleteDuplicates(self, head: Optional[ListNode]) -> Optional[ListNode]:
        def remove_duplicates(node: Optional[ListNode]) -> None:
            if node == None:
                return

            if node.next  == None:
                return

            if node.val == node.next.val:
                node.next = node.next.next
                return remove_duplicates(node)

            return remove_duplicates(node.next)

        remove_duplicates(head)

        return head
