import UIKit

// MARK: - 1. Two Sum, Easy
/*
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 You can return the answer in any order.
 
 Example 1:

 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 Example 2:

 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 Example 3:

 Input: nums = [3,3], target = 6
 Output: [0,1]
 */


//func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//    for i in 0..<nums.count {
//        for j in i+1..<nums.count {
//            if nums[i] + nums[j] == target {
//                return [i, j]
//            }
//        }
//    }
//    return []
//}

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    var map: [Int: Int] = [:]
    for (index, value) in nums.enumerated() {
        let diff = target - value
        if let otherIndex = map[diff] {
            return [index, otherIndex]
        }
        map[value] = index
    }
    return []
}

//print(twoSum([2,7,11,15], 9))
//print(twoSum([3,2,4], 6))
//print(twoSum([3,3], 6))

// MARK: - 21. Merge two sorted lists

/*
 You are given the heads of two sorted linked lists list1 and list2.

 Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.

 Return the head of the merged linked list.
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
    
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var dummyHead = ListNode(0)
    var current: ListNode? = dummyHead
    
    var p1 = l1
    var p2 = l2
    
    while p1 != nil && p2 != nil {
        if p1!.val < p2!.val {
            current?.next = p1
            p1 = p1?.next
        } else {
            current?.next = p2
            p2 = p2?.next
        }
        current = current?.next
    }
    
    if p1 != nil {
        current?.next = p1
    }
    
    if p2 != nil {
        current?.next = p2
    }
    
    return dummyHead.next
}

//MARK: 392. Is subsequence

/*
 A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).
 */

func isSubsequence(_ s: String, _ t: String) -> Bool {
    var sIndex = s.startIndex
    var tIndex = t.startIndex
    
    while sIndex < s.endIndex && tIndex < t.endIndex {
        if s[sIndex] == t[tIndex] {
            sIndex = s.index(after: sIndex)
        }
        
        tIndex = t.index(after: tIndex)
    }
    return sIndex == s.endIndex
}

//print(isSubsequence("abc", "ahbgdc"))



//MARK: 283. Move zeros
/*
 Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

 Note that you must do this in-place without making a copy of the array.
 */

func moveZeroes(_ nums: inout [Int]) {
    var nonZeroIndex = 0
    
    for num in nums {
        if num != 0 {
            nums[nonZeroIndex] = num
            nonZeroIndex += 1
        }
    }
    
    while nonZeroIndex < nums.count {
        nums[nonZeroIndex] = 0
        nonZeroIndex += 1
    }
}

var nums = [0,1,0,3,12]
moveZeroes(&nums)
//print(nums)

// MARK: - 977. Squares of a sorted array
/*
 Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.
 */

func sortedSquares(_ nums: [Int]) -> [Int] {
    
    var result = nums.map({$0 * $0})
//    for num in nums {
//        result.append(num * num)
//    }
    result.sort()
    return result
}

print(sortedSquares([-4,-1,0,3,10]))
//print("hello")


    
    
    
    
