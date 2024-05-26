import UIKit
import PlaygroundSupport
import Foundation

// EASY
// MARK: - 268. Missing number
/*
 Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.
 */

//func missingNumber(_ nums: [Int]) -> Int {
//    let n = nums.count
//    let currentSum = nums.reduce(0, +)
//    let totalSum = n*(n+1)/2
//    
//    return totalSum - currentSum
//}

// bit manipulation XOR
func missingNumber(_ nums: [Int]) -> Int {
    var missingNumber = 0
    for i in 0..<nums.count {
        missingNumber ^= (i+1) ^ nums[i]
    }
    return missingNumber
}

//print(missingNumber([3,0,1]))

// MARK: - 136. Single Number

/*
 Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.

 You must implement a solution with a linear runtime complexity and use only constant extra space.
 */

//func singleNumber(_ nums: [Int]) -> Int {
//    var allNumbers: [Int: Int] = [:]
//    
//    for num in nums {
//        allNumbers[num] = (allNumbers[num] ?? 0) + 1
//    }
//    
//    guard let singleNumber = allNumbers.filter({$0.value == 1}).map({ $0.key }).first else { return 0 }
//    return singleNumber
//}

func singleNumber(_ nums: [Int]) -> Int {
    
    return nums.reduce(0, ^)
}

//print(singleNumber([4,1,2,1,2]))
