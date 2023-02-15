//
//  131705.swift
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
