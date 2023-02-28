//
//  과일 장수.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/28.
//

import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {

    var count = [Int](repeating: 0, count: k+1)
    for i in score{
        count[i] += 1
    }

    var remain = score.count % m
    var index = 1
    while(remain > 0){
        if(count[index] >= remain){
            count[index] -= remain
            break
        }else{
            remain -= count[index]
            count[index] = 0
        }
        index += 1
    }

    var result = 0
    var pass = 0
    for i in 1...k{
        if(count[i] == 0){
            continue
        }else if(count[i] == pass){
            pass = 0
            continue
        }else if(count[i] - pass > 0){
            count[i] -= pass
            pass = 0
        }else{
            pass -= count[i]
            continue
        }
        let box = count[i] % m == 0 ? count[i] / m : count[i] / m + 1
        result += i * box * m
        pass = count[i] % m == 0 ? 0 : m - count[i] % m
    }

    return result
}
