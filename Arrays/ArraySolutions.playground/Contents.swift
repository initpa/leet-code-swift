import UIKit

//MARK: - 217. Contains duplicate, Easy
/*
 Arrays
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


// MARK: - 448. Find all dissappeared numbers, Easy
/*
 Arrays
 Given an array nums of n integers where nums[i] is in the range [1, n], return an array of all the integers in the range [1, n] that do not appear in nums.
 */

func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    
    var numSet = Set(1...nums.count)
    print(numSet)
    for num in nums {
        numSet.remove(num)
    }
    return Array(numSet)
}

//print(findDisappearedNumbers([4,3,2,7,8,2,3,1]))
//print(findDisappearedNumbers([1,1]))

//// MARK: - 2022. Convert 1D array into 2D array
///*
// Arrays
// You are given a 0-indexed 1-dimensional (1D) integer array original, and two integers, m and n. You are tasked with creating a 2-dimensional (2D) array with  m rows and n columns using all the elements from original.
//
// The elements from indices 0 to n - 1 (inclusive) of original should form the first row of the constructed 2D array, the elements from indices n to 2 * n - 1 (inclusive) should form the second row of the constructed 2D array, and so on.
//
// Return an m x n 2D array constructed according to the above procedure, or an empty 2D array if it is impossible.
//
//
// */
//
//func construct2DArray(_ original: [Int], _ m: Int, _ n: Int) -> [[Int]] {
// 
//    guard original.count == m * n else {
//        print("input array size is not equal to size of the 2D array")
//        return []
//    }
//            
//    
//    var result: [[Int]] = [[]]
//    return result
//}
//
//print(construct2DArray([1,2,3,4], 2, 2))

// MARK: - 283. Move non zeros, Easy
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


// MARK: - 136. Single number, Easy

/*
 Arrays, Bit manipulation
 Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.

 You must implement a solution with a linear runtime complexity and use only constant extra space.
 */

//func singleNumber(_ nums: [Int]) -> Int {
//    
/// using dictionary
//    var dict: [Int: Int] = [:]
//    for i in nums {
//        dict[i] = (dict[i] ?? 0) + 1
//    }
//    
//    guard let singleNumber = dict.filter {$0.value == 1}.keys.first else { return 0 }
//    return singleNumber
//}

/// using sets
func singleNumber(_ nums: [Int]) -> Int {

    var set: Set<Int> = []
    for num in nums {
        if set.contains(num) {
            set.remove(num)
        } else {
            set.insert(num)
        }
    }
    return set.first!
}

/// using maths

//func singleNumber(_ nums: [Int]) -> Int {
//    
//    let uniqueSum = nums.reduce(0, { $0 + ($1 * 2) })
//    let totalSum = nums.reduce(0, +)
//    
//    return uniqueSum - totalSum
//}
//print(singleNumber([2,2,1]))
//print(singleNumber([4,1,2,1,2]))
//print(singleNumber([1]))

// MARK: - 268. Missing number, Easy
/*
 Arrays, Bit manipulation
 Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.
 */

//func missingNumber(_ nums: [Int]) -> Int {
//    let n = nums.count
//    let totalSum = (n * (n + 1)) / 2
//    let arraySum = nums.reduce(0, +)
//    return totalSum - arraySum
//}

func missingNumber(_ nums: [Int]) -> Int {
    var missing = nums.count
    for (index, num) in nums.enumerated() {
        missing ^= index ^ num
    }
    
    return missing
}

//print(missingNumber([3,0,1]))
//print(missingNumber([0,1]))
//print(missingNumber([9,6,4,2,3,5,7,0,1]))




