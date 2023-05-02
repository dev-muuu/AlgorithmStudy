//
//  의상.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/02.
//

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var map = [String: Int]()
    for i in clothes{
        if map[i[1]] == nil {
            map[i[1]] = 0
        }
        map[i[1]]! += 1
    }
    
    return map.values.reduce(1){ $0 * ($1 + 1) } - 1
}
