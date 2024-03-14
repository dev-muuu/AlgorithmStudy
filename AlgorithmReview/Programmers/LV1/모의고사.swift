//
//  모의고사.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/23.
//

import Foundation

func solution(_ answers:[Int]) -> [Int] {

    var answer = [Int](repeating: 0, count: 3)
    
    func check(_ index: Int, _ input: [Int]) {
        for i in 0..<answers.count {
            let input = input[i%input.count]
            if input == answers[i] {
                answer[index] += 1
            }
        }
    }
    
    check(0, [1,2,3,4,5])
    check(1, [2,1,2,3,2,4,2,5])
    check(2, [3,3,1,1,2,2,4,4,5,5])

    let max = answer.max()!
    return answer.enumerated().filter{ $0.1 == max }.sorted(by: { $0.0 < $1.0 }).map{ $0.0+1 }
}
