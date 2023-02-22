//
//  소수 찾기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/22.
//

import Foundation

func solution(_ n:Int) -> Int {
    return (2...n).reduce(0){
        for i in 2..<$1{
            if($1 % i == 0){
                return $0
            }
        }
        return $0 + 1
    }
}
