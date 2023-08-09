//
//  과제 진행하기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/08/09.
//

import Foundation

func solution(_ plans:[[String]]) -> [String] {
    
    func convertTime(_ time: String) -> Int {
        let split = time.split(separator: ":").map{ Int(String($0))!}
        return split[0] * 60 + split[1]
    }
    
    let plans = plans.sorted(by: { $0[1] < $1[1] })
    
    var time: Int = convertTime(plans.first![1])
    var index = 1
    var ongoing: [(String, Int)] = [(plans.first![0], Int(plans.first![2])!)] //name, remainTime
    var end = [String]()
    
    while !ongoing.isEmpty {
        time += 1
        ongoing[ongoing.count-1].1 -= 1
        
        if ongoing.last!.1 == 0 {
            let pop = ongoing.removeLast()
            end.append(pop.0)
        }
        if index < plans.count && time == convertTime(plans[index][1]) {
            ongoing.append((plans[index][0], Int(plans[index][2])!))
            index += 1
        } else if index < plans.count && ongoing.isEmpty {
            ongoing.append((plans[index][0],  Int(plans[index][2])!))
            time = convertTime(plans[index][1])
            index += 1
        }
    }
    return end
}
