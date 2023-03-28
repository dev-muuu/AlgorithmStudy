//
//  H-Index.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/28.
//

import Foundation

func solution(_ citations:[Int]) -> Int {
    let sort = citations.sorted(by: >)
    for (i, c) in sort.enumerated(){
        if(i + 1 == c){
            return c
        }else if(i > 0 && i + 1 > c){
            return min(i, sort[i-1])
        }
    }
    return min(sort.count, sort.last!)
}
