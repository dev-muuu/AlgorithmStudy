//
//  시소 짝궁.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/07/24.
//

import Foundation

func reference(_ weights:[Int]) -> Int {
    
    let weights = weights.sorted(by: <)
    var map = [Int](repeating: 0, count: 1000*4 + 1)
    var original = [Int](repeating: 0, count: 1000 + 1)
    for w in weights {
        original[w] += 1
        [w*2, w*3, w*4].forEach {
            map[$0] += 1
        }
    }
    
    func combination(_ n: Int) -> Int{
        n * (n-1) / 2
    }
    
    let total = map.filter{ $0 > 1 }.reduce(0){ $0 + combination($1) }
    let remove = original.filter{ $0 > 1 }.reduce(0){ $0 + combination($1) * 2}
    return total - remove
}


func solution2(_ weights:[Int]) -> Int {
    
    var map = [Int:Int]()
    for i in weights {
        if map[i] == nil { map[i] = 0 }
        map[i]! += 1
    }
    
    var answer = 0
    for w in map {
        if w.value > 1 {
            answer += w.value * (w.value-1) / 2
        }
    }
    for w in map {
        for (i,j) in [(2,3), (2,4), (3,4)] {
            if w.key*i%j == 0 && map[Int(w.key*i/j)] != nil {
                answer += map[Int(w.key*i/j)]! * w.value
            }
        }
    }
    return answer
}
