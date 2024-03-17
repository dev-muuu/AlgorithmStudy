//
//  과일 장수.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/28.
//

import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {

    let score = score.sorted(by: >)
    var answer = 0
    
    for i in stride(from: 0, to: score.count, by: +m) {
        if i+m > score.count {
            break
        }
        answer += score[i..<i+m].last! * m
    }
    
    return answer
}
