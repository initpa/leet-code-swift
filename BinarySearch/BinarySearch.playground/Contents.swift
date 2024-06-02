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

//func findDuplicate(_ nums: [Int]) -> Int {
//    var dict: [Int: Int]  = [:]
//    for num in nums {
//        dict[num] = (dict[num] ?? 0) + 1
//    }
//    guard let result = dict.filter({$0.value >= 2}).map({$0.key}).first else { return 0 }
//    return result
//}
func findDuplicate(_ nums: [Int]) -> Int {
    var slow = nums[0]
    var fast = nums[0]
    
    repeat {
        slow = nums[slow]
        fast = nums[nums[fast]]
    } while slow != fast
    
    slow = nums[0]
    while slow != fast {
        slow = nums[slow]
        fast = nums[fast]
    }
    
    return slow
}
print(findDuplicate([1,3,4,2,2]))


// MARK: - 153. find minimum in rotated array
/*
 Suppose an array of length n sorted in ascending order is rotated between 1 and n times. For example, the array nums = [0,1,2,4,5,6,7] might become:

 [4,5,6,7,0,1,2] if it was rotated 4 times.
 [0,1,2,4,5,6,7] if it was rotated 7 times.
 Notice that rotating an array [a[0], a[1], a[2], ..., a[n-1]] 1 time results in the array [a[n-1], a[0], a[1], a[2], ..., a[n-2]].

 Given the sorted rotated array nums of unique elements, return the minimum element of this array.

 You must write an algorithm that runs in O(log n) time.
 */


func findMin(_ nums: [Int]) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left < right {
        let mid = left + (right - left) / 2
        
        if nums[mid] > nums[right] {
            left = mid + 1
        } else {
            right = mid
        }
    }
    
    return nums[left]
}


//print(findMin([3,4,5,1,2]))

//MARK: - 74. search 2D matrix

/*
 You are given an m x n integer matrix matrix with the following two properties:
 
 Each row is sorted in non-decreasing order.
 The first integer of each row is greater than the last integer of the previous row.
 Given an integer target, return true if target is in matrix or false otherwise.

 You must write a solution in O(log(m * n)) time complexity.
 */

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    guard !matrix.isEmpty else { return false }
    
    let m = matrix.count
    let n = matrix[0].count
    
    var left = 0
    var right = m * n - 1
    
    while left <= right {
        let mid = left + (right - left) / 2
        let midRow = mid / n
        let midCol = mid % n
        let midVal = matrix[midRow][midCol]
        
        if midVal == target {
            return true
        } else if midVal < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    
    return false
}

let matrix = [
    [1, 3, 5, 7],
    [10, 11, 16, 20],
    [23, 30, 34, 60]
]
let target = 3

print(searchMatrix(matrix, target))
