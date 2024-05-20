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

// MARK: - 2022. Convert 1D array into 2D array
/*
 Arrays
 You are given a 0-indexed 1-dimensional (1D) integer array original, and two integers, m and n. You are tasked with creating a 2-dimensional (2D) array with  m rows and n columns using all the elements from original.

 The elements from indices 0 to n - 1 (inclusive) of original should form the first row of the constructed 2D array, the elements from indices n to 2 * n - 1 (inclusive) should form the second row of the constructed 2D array, and so on.

 Return an m x n 2D array constructed according to the above procedure, or an empty 2D array if it is impossible.


 */

func construct2DArray(_ original: [Int], _ m: Int, _ n: Int) -> [[Int]] {
 
    guard original.count == m * n else {
        print("input array size is not equal to size of the 2D array")
        return []
    }
        
    var result: [[Int]] = []
    var index = 0
    
    for _ in 0..<n {
        var row: [Int] = []
        for _ in 0..<m {
            row.append(original[index])
            index += 1
        }
        result.append(row)
    }
    return result
}

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



// MARK: - MEDIUM

// MARK: - Product of Array except Self

/*
 Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

 You must write an algorithm that runs in O(n) time and without using the division operation.
 */

func productExceptSelf(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var result = Array(repeating: 1, count: n)
    
    var leftProduct = 1
    for i in 0..<n {
        result[i] = leftProduct
        leftProduct *= nums[i]
    }
    
    var rightProduct = 1
    for i in stride(from: n-1, through: 0, by: -1) {
        result[i] *= rightProduct
        rightProduct *= nums[i]
    }
        
    return result
}

//print(productExceptSelf([1,2,3,4]))

// MARK: - 287. Find the duplicate number
/*
 Arrays, Binary search, two pointers
 Given an array of integers nums containing n + 1 integers where each integer is in the range [1, n] inclusive.
 There is only one repeated number in nums, return this repeated number.
 You must solve the problem without modifying the array nums and uses only constant extra space.
 */

//func findDuplicate(_ nums: [Int]) -> Int {
//
//    var dict: [Int: Int] = [:]
//    for num in nums {
//        dict[num] = (dict[num] ?? 0) + 1
//    }
//    guard let result = dict.filter{$0.value > 1}.first?.key else { return 0 }
//    return result
//    return 0
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
        
    return fast
}

//print(findDuplicate([1,3,4,2,2]))

// MARK: - 442. Find all duplicates in an array.
/*
 Given an integer array nums of length n where all the integers of nums are in the range [1, n] and each integer appears once or twice, return an array of all the integers that appears twice.
 You must write an algorithm that runs in O(n) time and uses only constant extra space.
 */

//func findDuplicates(_ nums: [Int]) -> [Int] {
//    var dict: [Int: Int] = [:]
//    
//    for num in nums {
//        dict[num] = (dict[num] ?? 0) + 1
//    }
//    let result = dict.filter {$0.value > 1}.map {$0.key}
//    return result
//}
func findDuplicates(_ nums: [Int]) -> [Int] {
    var nums = nums
    var ans = [Int]()
    
    for num in nums {
        if nums[abs(num) - 1] < 0 {
            ans.append(num)
        }
        nums[abs(num) - 1] *= -1
    }
    
    return ans
}


//print(findDuplicates([4,3,2,7,8,2,3,1]))


// MARK: - 48. Rotate Image
/*
 You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).

 You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.
 */

func rotate(_ matrix: inout [[Int]]) {
    
    let n = matrix.count
    
    // Step 1: Transpose the matrix
    for i in 0..<n {
        for j in i+1..<n {
            let temp = matrix[i][j]
            matrix[i][j] = matrix[j][i]
            matrix[j][i] = temp
        }
    }
    
    // Step 2: Reverse each row
    for i in 0..<n {
        matrix[i].reverse()
    }
}
//var matrix = [[1,2,3],[4,5,6],[7,8,9]]
//rotate(&matrix)

// MARK: - 128. Longest consecutive sequence
/*
 Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.

 You must write an algorithm that runs in O(n) time.
 */
func longestConsecutive(_ nums: [Int]) -> Int {
    var setOfNums = Set(nums)
    var longestLength = 0
    
    for num in nums {
        if !setOfNums.contains(num - 1) {
            var currentNum = num
            var currentLength = 1
            
            while setOfNums.contains(currentNum + 1) {
                currentNum += 1
                currentLength += 1
            }
            longestLength = max(longestLength, currentLength)
        }
    }
    
    return longestLength
}

print(longestConsecutive([9,1,4,7,3,-1,0,5,8,-1,6]))










