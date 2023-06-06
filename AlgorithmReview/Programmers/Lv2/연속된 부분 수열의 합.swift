//
//  연속된 부분 수열의 합.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/06.
//

import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {

    var start = 0, end = 0
    var temp = sequence[0]
    var ans = [-1, 1000000]
    
    while start < sequence.count{
        if temp > k {
            temp -= sequence[start]
            start += 1
        } else if temp < k {
            if end + 1 >= sequence.count {
                break
            }
            end += 1
            temp += sequence[end]
        } else{
            if ans[1] - ans[0] > end - start {
                ans = [start, end]
            }
            if end + 1 >= sequence.count{
                break
            }
            end += 1
            temp += sequence[end]
        }
    }
    
    return ans
}
