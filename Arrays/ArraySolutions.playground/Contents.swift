import UIKit

//MARK: - Contains duplicate
/*
 Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
 Example 1:

 Input: nums = [1,2,3,1]
 Output: true
 Example 2:

 Input: nums = [1,2,3,4]
 Output: false
 Example 3:

 Input: nums = [1,1,1,3,3,4,3,2,4,2]
 Output: true
 */

func containsDuplicate(_ nums: [Int]) -> Bool {
    var seen = Set<Int>()
    for value in nums {
        if seen.contains(value) {
            return true
        }
        seen.insert(value)
    }
    return false
}

//print(containsDuplicate([1,2,3,1]))
//print(containsDuplicate([1,2,3,4]))
//print(containsDuplicate([1,1,1,3,3,4,3,2,4,2]))


// MARK: 283. Move non zeros, Easy
/*
 Array, Two pointers
 Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.
 Note that you must do this in-place without making a copy of the array.
 */

func moveZeroes(_ nums: inout [Int]) {
    var nonZeroIndex: Int = 0
    for i in 0..<nums.count {
        if nums[i] != 0 {
            nums.swapAt(i, nonZeroIndex)
            nonZeroIndex += 1
        }
    }
}

//func moveZeroes(_ nums: inout [Int]) {
//    var incrementIndex: Int = 0
//
//    for i in 0..<nums.count {
//        if nums[i] != 0 {
//            nums[incrementIndex] = nums[i]
//            incrementIndex += 1
//        }
//    }
//
//    for i in incrementIndex..<nums.count {
//        nums[i] = 0
//    }
//}

//var nums = [0,1,0,3,12]
//moveZeroes(&nums)
//print(nums)






