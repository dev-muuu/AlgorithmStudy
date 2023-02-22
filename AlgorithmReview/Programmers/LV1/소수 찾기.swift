//
//  소수 찾기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/22.
//

import Foundation

func solution1(_ n:Int) -> Int {
    return (2...n).reduce(0){
        for i in 2..<$1{
            if($1 % i == 0){
                return $0
            }
        }
        return $0 + 1
    }
}

func solution2(_ n:Int) -> Int {

    var filter = [Bool](repeating: true, count: n+1)

    return (2...n).reduce(0){ sum, num in
        
        if(!filter[num]){
            return sum
        }

        _ = (1...n/num).map{ index in
            filter[num * index] = false
        }
        return sum + 1
    }
}
