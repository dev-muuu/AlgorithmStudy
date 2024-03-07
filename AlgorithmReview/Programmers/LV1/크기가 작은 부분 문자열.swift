//
//  크기가 작은 부분 문자열.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/18.
//

import Foundation

func solution(_ t:String, _ p:String) -> Int {
    
    var answer = 0
    let t = Array(t).map{ String($0) }
    
    for i in 0..<t.count-p.count+1 {
        if t[i..<i+p.count].joined() <= p {
            answer += 1
        }
    }
    
    return answer
}
