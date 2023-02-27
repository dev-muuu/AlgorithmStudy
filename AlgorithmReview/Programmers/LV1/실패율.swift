//
//  실패율.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/27.
//

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    var fail = [Float](repeating: 0, count: N+1)
    var reach = [Float](repeating: 0, count: N+1)
    
    for i in stages{
        
        var end: Int
        if(i > N){
            end = N
        }else{
            end = i
            fail[i] += 1
        }
        
        for i in 1...end{
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
        if($0.element == $1.element){
            return $0.offset < $1.offset
        }
        return $0.element > $1.element
    }).map{
        $0.offset + 1
    }
}
