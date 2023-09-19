//
//  요격 시스템.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/08/11.
//

import Foundation

func reference(_ targets:[[Int]]) -> Int {
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

//반례: [[0, 4], [1, 2], [1, 3], [3, 4]] -> 2
func solution(_ targets:[[Int]]) -> Int {
    let targets = targets.sorted(by: { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0] })
    var ans = 0, coord = (-1, 0)
    for m in targets{
        if m[1] < coord.1 {
            coord.1 = m[1]
        } else if m[0] >= coord.1 {
            coord = (m[0], m[1])
            ans += 1
        }
    }
    return ans
}
