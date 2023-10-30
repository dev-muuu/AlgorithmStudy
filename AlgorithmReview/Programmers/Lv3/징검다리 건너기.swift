//
//  징검다리 건너기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/10/10.
//

import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    var l = 1, r = 200000000
    while l <= r {
        let mid = (l+r)/2
        var p = 0
        for s in stones {
            p = s <= mid ? p+1 : 0
            if p == k { break }
        }
        if p < k {
            l = mid+1
        } else {
            r = mid-1
        }
    }
    return l
}
