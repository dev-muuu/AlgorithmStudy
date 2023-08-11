//
//  요격 시스템.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/08/11.
//

import Foundation

func solution(_ targets:[[Int]]) -> Int {
    var targets = targets.sorted(by: { $0[1] == $1[1] ? $0[0] < $1[0] : $0[1] < $1[1] })
    var s = 0, e = 0
    var ans = 0
    for i in targets {
        if i[0] >= e {
            ans += 1
            s = i[0]
            e = i[1]
        }
    }
    return ans
}
