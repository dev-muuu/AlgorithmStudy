//
//  주차 요금 계산.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/15.
//

import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    
    func time(_ t: String) -> Int {
        let data = t.split(separator: ":").map{ Int($0)! }
        return data[0]*60 + data[1]
    }
    
    func calculate(_ t: Int) -> Int {
        if t <= fees[0]{
            return fees[1]
        }
        return fees[1] + Int(ceil(Float(t-fees[0])/Float(fees[2]))) * fees[3]
    }
    
    var car = [String:[Int]]()
    for record in records{
        
        let data = record.split(separator: " ").map{ String($0) }
        
        if car[data[1]] == nil {
            car[data[1]] = []
        }
        
        car[data[1]]!.append(time(data[0]))
    }
        
    var answer = [Int]()
    for (c,_) in car.sorted(by: { $0.key < $1.key }) {
        
        if car[c]!.count % 2 != 0 {
            car[c]!.append(time("23:59"))
        }
            
        var total = 0
        for i in stride(from: 0, to: car[c]!.count, by: +2){
            total += car[c]![i+1] - car[c]![i]
        }
            
        answer.append(calculate(total))
    }
        
    return answer
}
