import UIKit


//MARK: - 704. Binary Search
/*
 Easy.
 Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.

 You must write an algorithm with O(log n) runtime complexity.
 */

func search(_ nums: [Int], _ target: Int) -> Int {
    return binarySearch(nums, target, 0, nums.count-1)
}

func binarySearch(_ nums: [Int],_ target: Int,_ left: Int,_ right: Int) -> Int {
    
    if left <= right {
        let mid = left + (right - left ) / 2
        
        if target == nums[mid] {
            return mid
        } else if target > nums[mid] {
            return binarySearch(nums, target, mid + 1, right)
        } else if target < nums[mid] {
            return binarySearch(nums, target, left, mid - 1)
        }
    }
    return -1
}

print(search([-1,0,3,5,9,12], 2))

