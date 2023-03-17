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

    var reports = [String: [Int]]()
    for i in Set(report){
        let info = i.split(separator: " ").map{ String($0) }
        if(reports[info[1]] == nil){
            reports[info[1]] = []
        }
        reports[info[1]]!.append(idMapping[info[0]]!)
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

func reference(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reported: [String: Int] = [:]
    var user: [String: [String]] = [:]

    for r in Set(report) {
        let splited = r.split(separator: " ").map { String($0) }
        user[splited[0]] = (user[splited[0]] ?? []) + [splited[1]]
        reported[splited[1]] = (reported[splited[1]] ?? 0) + 1
    }

    return id_list.map { id in
        return (user[id] ?? []).reduce(0) {
            $0 + ((reported[$1] ?? 0) >= k ? 1 : 0)
        }
    }
}
