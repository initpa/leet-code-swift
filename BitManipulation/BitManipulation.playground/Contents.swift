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

print(missingNumber([3,0,1]))


