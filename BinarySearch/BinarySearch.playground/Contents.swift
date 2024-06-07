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
//print(findDuplicate([1,3,4,2,2]))


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

//func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
//    guard !matrix.isEmpty else { return false }
//    
//    let m = matrix.count
//    let n = matrix[0].count
//    
//    var left = 0
//    var right = m * n - 1
//    
//    while left <= right {
//        let mid = left + (right - left) / 2
//        let midRow = mid / n
//        let midCol = mid % m
//        let midVal = matrix[midRow][midCol]
//        
//        if midVal == target {
//            return true
//        } else if midVal < target {
//            left = mid + 1
//        } else {
//            right = mid - 1
//        }
//    }
//    
//    return false
//}

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    if matrix.isEmpty {
        return false
    }
    let rows = matrix.count
    let cols = matrix[0].count
    
    var row = rows - 1
    var col = 0
    
    while col < cols && row < rows && row >= 0 && col >= 0 {
        if matrix[row][col] == target {
            return true
        } else if matrix[row][col] > target {
            row -= 1
        } else {
            col += 1
        }
    }
    return false
}

//let matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,50]]
//let target = 3

//print(searchMatrix(matrix, target))

//MARK: - 162. Find peak element

/*
 A peak element is an element that is strictly greater than its neighbors.

 Given a 0-indexed integer array nums, find a peak element, and return its index. If the array contains multiple peaks, return the index to any of the peaks.

 You may imagine that nums[-1] = nums[n] = -∞. In other words, an element is always considered to be strictly greater than a neighbor that is outside the array.

 You must write an algorithm that runs in O(log n) time.
 */


func findPeakElement(_ nums: [Int]) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left < right {
        let mid = left + (right - left) / 2
        
        // Check if mid is a peak
        if nums[mid] > nums[mid + 1] {
            // Peak found, move left
            right = mid
        } else {
            // Peak is on the right side, move right
            left = mid + 1
        }
    }
    
    // At the end of the loop, left == right and it points to a peak
    return left
}

// Example usage:
//let nums = [1, 2, 1, 3, 5, 6, 4]
//let peakIndex = findPeakElement(nums)
//print("Peak element index:", peakIndex) // Output: 1 or 5


//MARK: - 378. Kth smallest element in a sorted array
/*
 Given an n x n matrix where each of the rows and columns is sorted in ascending order, return the kth smallest element in the matrix.
 Note that it is the kth smallest element in the sorted order, not the kth distinct element.
 You must find a solution with a memory complexity better than O(n2).
 */


func countLessEqual(_ matrix: [[Int]], _ guess: Int) -> Int {
    var count = 0
    let n = matrix.count
    var row = n - 1
    var col = 0
    while row >= 0 && col < n {
        if matrix[row][col] <= guess {
            count += row + 1
            col += 1
        } else {
            row -= 1
        }
    }
    return count
}

func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
    let n = matrix.count
    var low = matrix[0][0]
    var high = matrix[n - 1][n - 1]

    while low < high {
        let mid = low + (high - low) / 2
        let count = countLessEqual(matrix, mid)
        if count < k {
            low = mid + 1
        } else {
            high = mid
        }
    }

    return low
}

// Example usage:
//let kmatrix = [
//    [1,  5,  9],
//    [10, 11, 13],
//    [12, 13, 15]
//]
//let k = 8
//print(kthSmallest(kmatrix, k))  Output should be 13

//MARK: - 852. Peak index in a mountain array
/*
 An array arr is a mountain if the following properties hold:

 arr.length >= 3
 There exists some i with 0 < i < arr.length - 1 such that:
 arr[0] < arr[1] < ... < arr[i - 1] < arr[i]
 arr[i] > arr[i + 1] > ... > arr[arr.length - 1]
 Given a mountain array arr, return the index i such that arr[0] < arr[1] < ... < arr[i - 1] < arr[i] > arr[i + 1] > ... > arr[arr.length - 1].

 You must solve it in O(log(arr.length)) time complexity.
 */

func peakIndexInMountainArray(_ arr: [Int]) -> Int {
    var left = 0
    var right = arr.count - 1
    
    while left < right {
        let mid = left + (right - left) / 2
        
        if arr[mid] < arr[mid + 1] {
            left = mid + 1
        } else {
            right = mid
        }
    }
    
    return left
}

// Example usage:
//let arr = [0, 1, 0]
//print(peakIndexInMountainArray(arr)) // Output should be 1

//MARK: - 81. Search in rotated array II
/*
 There is an integer array nums sorted in non-decreasing order (not necessarily with distinct values).

 Before being passed to your function, nums is rotated at an unknown pivot index k (0 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,4,4,5,6,6,7] might be rotated at pivot index 5 and become [4,5,6,6,7,0,1,2,4,4].

 Given the array nums after the rotation and an integer target, return true if target is in nums, or false if it is not in nums.

 You must decrease the overall operation steps as much as possible.
 */

func searchB(_ nums: [Int], _ target: Int) -> Bool {
    if nums.isEmpty {
        return false
    }
    
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        let mid = (left + right) / 2
        
        if nums[mid] == target {
            return true
        }
        
        // Left half is sorted
        if nums[left] < nums[mid] {
            if nums[left] <= target && target < nums[mid] {
                right = mid - 1
            } else {
                left = mid + 1
            }
        } else if nums[left] > nums[mid] { // Right half is sorted
            if nums[mid] < target && target <= nums[right] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        } else { // nums[left] == nums[mid], move left pointer
            left += 1
        }
    }
    
    return false
}

// Example usage:
//let nums = [4, 5, 6, 6, 7, 0, 1, 2, 4, 4]
//let target = 5
//print(searchB(nums, target)) // Output: true


//MARK: - 240. Search a 2D matrix II
/*
 Write an efficient algorithm that searches for a value target in an m x n integer matrix matrix. This matrix has the following properties:

 Integers in each row are sorted in ascending from left to right.
 Integers in each column are sorted in ascending from top to bottom.
 */

func searchMatrix2(_ matrix: [[Int]], _ target: Int) -> Bool {
    guard !matrix.isEmpty && !matrix[0].isEmpty else {
        return false
    }
    
    var row = 0
    var col = matrix[0].count - 1
    
    while row < matrix.count && col >= 0 {
        let current = matrix[row][col]
        
        if current == target {
            return true
        } else if current > target {
            col -= 1
        } else {
            row += 1
        }
    }
    
    return false
}

// Example usage:
let matrix = [
    [1, 4, 7, 11, 15],
    [2, 5, 8, 12, 19],
    [3, 6, 9, 16, 22],
    [10, 13, 14, 17, 24],
    [18, 21, 23, 26, 30]
]
let target = 5
print(searchMatrix2(matrix, target)) // Output: true


// MARK: - 658. Find K Elements

/*
 Given a sorted integer array arr, two integers k and x, return the k closest integers to x in the array. The result should also be sorted in ascending order.

 An integer a is closer to x than an integer b if:

 |a - x| < |b - x|, or
 |a - x| == |b - x| and a < b
 */

func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
    var left = 0
    var right = arr.count - k

    while left < right {
        let mid = left + (right - left) / 2
        if x - arr[mid] > arr[mid + k] - x {
            left = mid + 1
        } else {
            right = mid
        }
    }

    return Array(arr[left..<left + k])
}

let arr = [1, 2, 3, 4, 5]
let k = 4
let x = 3
let result = findClosestElements(arr, k, x)
print(result) // Output: [1, 2, 3, 4]
