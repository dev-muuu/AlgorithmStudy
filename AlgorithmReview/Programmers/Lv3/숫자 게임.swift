//
//  숫자 게임.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/07.
//

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    
    var answer: Int = 0
    var aTeam: [Int] = a.sorted(by: >)
    var bTeam: [Int] = b.sorted(by: >)
    
    var bPointer = 0
    for i in 0..<aTeam.count{
        if bTeam[bPointer] > aTeam[i]{
            bPointer += 1
            answer += 1
        }
    }
    return answer
}
