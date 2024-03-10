//
//  가장 가까운 같은 글자.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/22.
//

import Foundation

func solution(_ s:String) -> [Int] {
    var answer = [Int](repeating: -1, count: s.count)
    var map = [Character:Int]()
    for (i, c) in Array(s).enumerated() {
        if let previous = map[c] {
            answer[i] = i-previous
        }
        map[c] = i
    }
    return answer
}
