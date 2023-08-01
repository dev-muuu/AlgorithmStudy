//
//  후보키.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/08/01.
//

import Foundation

func solution(_ relation:[[String]]) -> Int {
    
    let column = relation[0].count
    var candidate = Set<[Int]>()
    
    func make(_ index: Int, _ keys: [Int]){
        if check(keys) {
            candidate.insert(keys); return
        }
        for i in stride(from: index+1, to: column, by: +1) {
            make(i, keys + [i])
            make(i, keys)
        }
    }
    
    func check(_ cols: [Int]) -> Bool{
        var storage = Set<[String]>()
        for row in relation {
            var data = [String]()
            for j in cols{
                data.append(row[j])
            }
            storage.insert(data)
        }
        return storage.count == relation.count
    }
    
    for i in 0..<column{
        make(i, [i])
    }
    
    var tempAns = candidate.sorted(by: { $0.count > $1.count }).map { Set<Int>($0) }
    var ans = 0
    var index = 0
    while index < tempAns.count {
        let target = tempAns[index]
        var isCandidate = true
        for i in stride(from: index+1, to: tempAns.count, by: +1){
            let standard = tempAns[i]
//             if standard.intersection(target) == standard { isCandidate = false; break }
            if standard.isSubset(of: target){ isCandidate = false; break }
        }
        if isCandidate { ans += 1 }
        index += 1
    }

    return ans
}
