//
//  연속된 부분 수열의 합.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/06.
//

import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    
    var left = 0, right = 0
    var sum = sequence[left]
    var ans = [left, sequence.count-1]
    
    while left < sequence.count{
        if sum == k {
            if ans[1] - ans [0] > right - left {
                ans = [left, right]
            }
            if right+1 < sequence.count {
                right += 1
                sum += sequence[right]
            } else {
                break
            }
        } else if sum < k {
            if right+1 < sequence.count {
                right += 1
                sum += sequence[right]
            } else {
                break
            }
        } else { //sum > k
            sum -= sequence[left]
            left += 1
        }
    }
    return ans
}
