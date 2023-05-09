//
//  베스트앨범.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/09.
//

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {

    var sum = [String:Int]()
    var mapping = [String:[(Int, Int)]]() //(0: id, 1: play)
    for (i, genre) in genres.enumerated(){
        if mapping[genre] == nil {
            mapping[genre] = []
            sum[genre] = 0
        }
        mapping[genre]!.append((i, plays[i]))
        sum[genre]! += plays[i]
    }

    for i in mapping.keys{
        mapping[i] = mapping[i]!.sorted(by: {
            $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 > $1.1
        })
    }

    let sortedMap = mapping.sorted(by: { sum[$0.key]! > sum[$1.key]! })
    var ans = [Int]()
    for i in sortedMap{
        for j in stride(from: 0, to: min(2, i.value.count), by: +1){
            ans.append(i.value[j].0)
        }
    }

    return ans
}
