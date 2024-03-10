//
//  K번째 수.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/18.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/42748

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer = [Int]()
    for c in commands {
        answer.append(array[c[0]-1..<c[1]].sorted(by: <)[c[2]-1])
    }
    return answer
}
