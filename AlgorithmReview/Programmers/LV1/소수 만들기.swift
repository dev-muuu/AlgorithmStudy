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
