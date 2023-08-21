//
//  순위 검색.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/08/21.
//

import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    
    var defaultSet = Set<Int>()
    for i in (0...info.count-1) { defaultSet.insert(i) }
    
    var information = [String : Set<Int>]()
    ["cpp", "java", "python", "backend", "frontend", "junior", "senior", "chicken", "pizza"].forEach {
        information[$0] = Set()
    }

    var score = [Int]()
    for (id, i) in info.enumerated() {
        let split = i.split(separator: " ").map{ String($0) }
        for s in 0...3 {
            information[split[s]]!.insert(id)
        }
        score.append(Int(split.last!)!)
    }

    var ans = [Int]()
    for q in query {
        let splitQuery = q.replacingOccurrences(of: "and", with: "")
                          .replacingOccurrences(of: "-", with: "")
                          .split(separator: " ")
                          .map { String($0) }
        
        let hasNumber = Int(splitQuery.last!) != nil
        var intersection = defaultSet
        for i in stride(from: 0, to: hasNumber ? splitQuery.count - 1 : splitQuery.count ,by: +1){
            intersection = intersection.intersection(information[splitQuery[i]]!)
        }
        if hasNumber {
            let numQuery = Int(splitQuery.last!)!
            intersection = intersection.filter{ score[$0] >= numQuery }
        }
        ans.append(intersection.count)
    }
    return ans
}
