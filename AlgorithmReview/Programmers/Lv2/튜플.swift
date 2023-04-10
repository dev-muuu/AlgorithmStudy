//
//  튜플.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/04/10.
//

import Foundation

func solution(_ s:String) -> [Int] {
    let tuples = s.split(whereSeparator: { $0 == "{" || $0 == "}"}).filter{ $0 != ","}.sorted(by: { $0.count < $1.count })
    var before = Set<Substring>()
    var result = [Int]()
    for i in tuples{
        let set = Set(i.split(separator: ","))
        let remain = set.subtracting(before)
        result.append(Int(remain.first!)!)
        before = set
    }
    return result
}
