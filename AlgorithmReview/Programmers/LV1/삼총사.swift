//
//  삼총사.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/15.
//

import Foundation

func solution(_ number:[Int]) -> Int {
    var count = 0
    for i in 0..<number.count{
        for j in i+1..<number.count{
            for k in j+1..<number.count{
                if(number[j] + number[k] == -number[i]){
                    count += 1
                }
            }
        }
    }
    return count
}

func solution2(_ number:[Int]) -> Int {

    var answer = 0
    var visit = [Bool](repeating: false, count: number.count)

    func comb(_ index: Int, _ sum: Int, _ count: Int) {
        
        if count == 3 && sum == 0 {
            answer += 1
            return
        }
        
        for i in index..<number.count {
            if !visit[i] {
                visit[i] = true
                comb(i+1, sum+number[i], count+1)
                visit[i] = false
            }
        }
    }
    
    comb(0, 0, 0)
    
    return answer
}
