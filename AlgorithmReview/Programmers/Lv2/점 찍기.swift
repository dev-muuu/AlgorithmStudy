//
//  점 찍기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/09.
//

import Foundation

func solution(_ k:Int, _ d:Int) -> Int64 {
    var ans = 0
    for i in stride(from: 0, to: d+1, by: +k){
        ans += Int(sqrt(Double(d*d - i*i))) / k + 1
    }
    return Int64(ans)
}
