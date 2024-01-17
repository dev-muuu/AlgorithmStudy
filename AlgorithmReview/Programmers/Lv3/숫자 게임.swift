//
//  숫자 게임.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/07.
//

import Foundation

func reference(_ a:[Int], _ b:[Int]) -> Int {
    
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

func solution(_ a:[Int], _ b:[Int]) -> Int {

    let a = a.sorted(by: >)
    let b = b.sorted(by: >)
    
    var ap = 0, bp = 0
    var answer = 0
    
    while ap < a.count && bp < b.count {
        if a[ap] < b[bp] {
            answer += 1
            bp += 1
            ap += 1
        }
        else {
            ap += 1
        }
    }
    
    return answer
}
