//
//  신고 결과 받기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/17.
//

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {

    var idMapping = [String: Int]()
    for (idx, id) in id_list.enumerated(){
        idMapping[id] = idx
    }

    var reports = [String: Set<Int>]()
    for i in report{
        let info = i.split(separator: " ").map{ String($0) }
        if(reports[info[1]] == nil){
            reports[info[1]] = Set<Int>()
        }
        reports[info[1]]!.insert(idMapping[info[0]]!)
    }

    var result = [Int](repeating: 0, count: id_list.count)
    for i in reports{
        if(i.value.count >= k){
            for id in i.value {
                result[id] += 1
            }
        }
    }

    return result
}
