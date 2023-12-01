//
//  주차 요금 계산.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/15.
//

import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    
    let records: [(time: Int, id: String)] = records.map {
    
        let split = $0.split(separator: " ")
        let splitTime = split[0].split(separator: ":").map{ Int($0)! }

        return (splitTime[0]*60 + splitTime[1], String(split[1]))
    }
    
    var inoutDict = [String:Int]()
    var total = [String: Int]()
    
    //누적 사용시간 계산
    for r in records {
        if inoutDict[r.id] == nil {
            inoutDict[r.id] = r.time
        }
        else {
            if total[r.id] == nil {
                total[r.id] = 0
            }
            total[r.id]! += r.time - inoutDict[r.id]!
            inoutDict.removeValue(forKey: r.id)
        }
    }
    
    //출차하지 않은 차량 누적 시간 계산
    for i in inoutDict {
        let end = 23*60 + 59
        if total[i.key] == nil {
            total[i.key] = 0
        }
        total[i.key]! += end-i.value
    }

    //id 오름차순으로 요금 계산
    return total.sorted(by: { $0.key < $1.key }).map {
        var cost: Int = fees[1]
        if $0.value > fees[0] {
            let unit = Int(ceil(Float($0.value-fees[0]) / Float(fees[2])))
            cost += unit * fees[3]
        }
        return cost
    }
}
