//
//  입국 심사.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/08/30.
//

import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int {
    var l = 1, r = times.max()! * n
    var ans = r
    while l <= r {
        let mid = (l+r)/2
        var p = 0
        for t in times {
            p += mid/t
            if p >= n { break }
        }
        if p >= n {
            ans = min(ans, mid)
            r = mid-1
        } else {
            l = mid+1
        }
    }
    return ans
}
