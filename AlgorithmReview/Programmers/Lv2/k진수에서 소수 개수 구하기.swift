//
//  k진수에서 소수 개수 구하기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/10.
//

import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    let radix = String(n, radix: k).split(separator: "0").map{ Int($0)! }
    var ans = 0
    for i in radix{
        var isDecimal = true
        for j in stride(from: 2, to: Int(sqrt(Double(i))) + 1,by: +1){
            if i % j == 0 {
                isDecimal = false; break
            }
        }
        if i != 1 && isDecimal {
            ans += 1
        }
    }
    return ans
}
