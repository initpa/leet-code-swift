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

print(twoSum([2,7,11,15], 9))
print(twoSum([3,2,4], 6))
print(twoSum([3,3], 6))


