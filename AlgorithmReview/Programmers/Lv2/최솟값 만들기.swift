//
//  최솟값 만들기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/20.
//

import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int{
    let a = A.sorted(by: <)
    let b = B.sorted(by: >)
    var ans = 0
    for i in 0..<a.count{
        ans += a[i] * b[i]
    }
    return ans
}
