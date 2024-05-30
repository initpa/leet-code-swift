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

//print(search([-1,0,3,5,9,12], 2))

// MARK: - 744. Find smallest letter greater than target
/*
 You are given an array of characters letters that is sorted in non-decreasing order, and a character target. There are at least two different characters in letters.

 Return the smallest character in letters that is lexicographically greater than target. If such a character does not exist, return the first character in letters.
 */

func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
    var left = 0
    var rigth = letters.count
    
    while left < rigth {
        let mid = left + (rigth - left)/2
        
        if target >= letters[mid] {
            left = mid + 1
        } else {
            rigth = mid
        }
    }
        
    return left < letters.count ? letters[left] : letters[0]
}

//print(nextGreatestLetter(["c","f","j"], "a"))

//MARK: - 287. Find the duplicate number
/*
 Given an array of integers nums containing n + 1 integers where each integer is in the range [1, n] inclusive.
 There is only one repeated number in nums, return this repeated number.
 You must solve the problem without modifying the array nums and uses only constant extra space.
 */

func findDuplicate(_ nums: [Int]) -> Int {
    var dict: [Int: Int]  = [:]
    for num in nums {
        dict[num] = (dict[num] ?? 0) + 1
    }
    guard let result = dict.filter({$0.value >= 2}).map({$0.key}).first else { return 0 }
    return result
}

print(findDuplicate([1,3,4,2,2]))
