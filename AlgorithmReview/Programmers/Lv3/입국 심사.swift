//
//  입국 심사.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/08/30.
//

import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int {
    var ans = 0
    var left = 1, right = times.max()! * n
    while left <= right {
        var mid = (left + right) / 2
        var people = 0
        for time in times{
            people += mid / time
            if people >= n { break }
        }
        if people >= n{
            ans = mid
            right = mid - 1
        }
        else if people < n{
            left = mid + 1
        }
    }
    return ans
}
