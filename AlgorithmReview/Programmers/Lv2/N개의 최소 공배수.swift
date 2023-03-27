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

func reference(_ arr:[Int]) -> Int {
    func gcdOfTwoNumbers(_ a: Int, _ b: Int) -> Int {
        let r = a % b
        return r != 0 ? gcdOfTwoNumbers(b, r) : b
    }

    func lcmOfTwoNumbers(_ a: Int, _ b: Int) -> Int {
        return a * b / gcdOfTwoNumbers(a, b)
    }
    
    return arr.reduce(1){ lcmOfTwoNumbers($0, $1) }
}
