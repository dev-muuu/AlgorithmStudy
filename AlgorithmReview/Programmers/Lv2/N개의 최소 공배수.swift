//
//  N개의 최소 공배수.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/27.
//

import Foundation

//시간 초과
func solution(_ arr:[Int]) -> Int {

    var arr = arr.sorted(by: >)
    let total = arr.reduce(1){ $0 * $1 }
    
    var candidate = [Int]()
    var target = 1
    while(arr.first! * target <= total){
        candidate.append(arr.first! * target)
        target += 1
    }
    for (c,i) in arr.enumerated(){
        if(c == 0){ continue }
        var newCandidate = [Int]()
        for j in candidate{
            if(j % i == 0){
                newCandidate.append(j)
            }
        }
        candidate = newCandidate
    }
    return candidate.first!
}
