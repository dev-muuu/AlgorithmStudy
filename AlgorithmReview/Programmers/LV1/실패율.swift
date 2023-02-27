//
//  실패율.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/27.
//

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    var fail = [Float](repeating: 0, count: N+2)
    var reach = [Float](repeating: 0, count: N+2)
    
    for i in stages{
        fail[i] += 1
        for i in 1...i{
            reach[i] += 1
        }
    }
    
    var percentage = [Float](repeating: 0 , count: N)
    for i in 0..<N{
        if(reach[i+1] == 0){
            continue
        }
        percentage[i] = fail[i+1] / reach[i+1]
    }
    
    return percentage.enumerated().sorted(by: {
        $0.element == $1.element ? $0.offset < $1.offset : $0.element > $1.element
    }).map{
        $0.offset + 1
    }
}
