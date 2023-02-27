//
//  소수 만들기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/24.
//

import Foundation

func solution(_ nums:[Int]) -> Int {

    var count = 0
    for i in 0..<nums.count{
        for j in i+1..<nums.count{
            for k in j+1..<nums.count{
                
                let sum = nums[i] + nums[j] + nums[k]
                var divide = 2
                var isDecimal = true
                while(divide < sum){
                    if(sum % divide == 0){
                        isDecimal = false
                        break
                    }
                    divide += 1
                }
                if(isDecimal){
                    count += 1
                }
            }
        }
    }
    return count
}

func reference(_ nums:[Int]) -> Int {

    func isPrime(_ num: Int) -> Bool {
        var n = 2
        while n < num {
            if num % n == 0 { return false }
            n += 1
        }
        return true
    }

    var answer = 0

    for i in 0 ..< nums.count - 2 {
        for j in i + 1 ..< nums.count - 1 {
            for k in j + 1 ..< nums.count {
                if isPrime(nums[i] + nums[j] + nums[k]) { answer += 1 }
            }
        }
    }
    return answer
}
