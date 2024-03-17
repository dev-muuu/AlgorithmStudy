//
//  기사단원의 무기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/07.
//

import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    
    var count = [Int](repeating: 1, count: number+1)
    for i in stride(from: 2, to: number+1, by: +1) {
        var num = 1
        while i * num <= number {
            count[i*num] += 1
            num += 1
        }
    }
    
    var answer = 0
    for i in stride(from: 1, to: number+1, by: +1) {
        answer += count[i] > limit ? power : count[i]
    }
    
    return answer
}
