//
//  추억 점수.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2024/03/14.
//

import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {

    var map = [String: Int]()
    for (n,y) in zip(name, yearning) {
        map[n] = y
    }
    
    var answer = [Int]()
    for p in photo {
        answer.append(p.reduce(0){ $0 + (map[$1] ?? 0) })
    }
    
    return answer
}
