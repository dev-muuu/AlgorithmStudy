//
//  튜플.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/04/10.
//

import Foundation

func solution(_ s:String) -> [Int] {
    
    let data = s.split(whereSeparator: { $0 == "{" || $0 == "}" })
                .filter{ $0 != "," }
                .map{ $0.split(separator: ",").map{ Int($0)! } }
                .sorted(by: { $0.count < $1.count })
    
    var storage = Set<Int>()
    var ans = [Int]()
    for i in data {
        let remain = Set(i).subtracting(storage)
        storage.insert(remain.first!)
        ans.append(remain.first!)
    }
    
    return ans
}
