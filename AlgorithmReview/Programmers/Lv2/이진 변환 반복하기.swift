//
//  이진 변환 반복하기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/21.
//

import Foundation

func solution(_ s:String) -> [Int] {
    var remain = s
    var ans = [0,0]
    while(remain != "1"){
        var zeroCount = remain.split(separator: "1").joined().count
        ans[0] += 1
        ans[1] += zeroCount
        remain = String(remain.count - zeroCount, radix: 2)
    }
    return ans
}
