/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} head
 * @return {ListNode}
 */
var deleteDuplicates = function(head) {
  const dedup = node => {
    if (node === null) return;
    if (node.next === null) return;

    if (node.val === node.next.val) {
      // remove next
      //console.log("removing:", node.next.val);
      node.next = node.next.next;
      dedup(node);
    } else {
      dedup(node.next);
    }
  };

  dedup(head);

  return head;
};
