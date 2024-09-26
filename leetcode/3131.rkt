(define/contract (added-integer nums1 nums2)
  (-> (listof exact-integer?) (listof exact-integer?) exact-integer?)
  (- (apply min nums2)
     (apply min nums1)))
