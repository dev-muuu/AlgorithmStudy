//
//  실패율.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/27.
//

import Foundation

func solution(_ n:Int, _ stages:[Int]) -> [Int] {
    
    var count = [(Int, Int)](repeating: (0,0), count: n+1) //스테이지 도달했지만 클리어X 플레이어수, 스테이지에 도달한 플레이어수
    for s in stages {
        count[s-1].0 += 1
    }

    count[n].1 = count[n].0
    for i in stride(from: n-1, to: -1, by: -1){
        count[i].1 = count[i+1].1 + count[i].0
    }
    count.removeLast()

    return count.map{ Float($0)/Float($1) }.enumerated().sorted(by: { $0.1 > $1.1 }).map{ $0.0+1 }
}
