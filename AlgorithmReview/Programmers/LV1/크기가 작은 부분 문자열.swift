//
//  크기가 작은 부분 문자열.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/18.
//

import Foundation

func solution(_ t:String, _ p:String) -> Int {
    let tArray = Array(t)
    var count = 0
    for i in 0..<t.count{
        if(i + p.count - 1 >= t.count){
            break
        }
        let value = tArray[i...i+p.count-1].map{String($0)}.joined()
        if(Int(value)! <= Int(p)!){
            count += 1
        }
    }
    return count
}
