//
//  가장 긴 팰린드롬.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/09/01.
//

import Foundation

func solution(_ s:String) -> Int {
    let s = Array(s)
    var ans = 1
    for i in stride(from: 0, to: s.count, by: +1) {
        var m = 1
        while i-m >= 0 && i+m < s.count && s[i-m] == s[i+m] {
            m += 1
        }
        ans = max(2*(m-1)+1, ans)
        
        m = 0
        while i-m >= 0 && i+m+1 < s.count && s[i-m] == s[i+1+m] {
            m += 1
        }
        ans = max(2*m, ans)
    }
    return ans
}
