//
//  주차 요금 계산.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/15.
//

import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    
    var carMap = [String: String]() //차량번호 : 시간
    var parkingSum = [String: Int]() //차량번호 : 누적 시간
    
    func getTimeOfMinute(time: String) -> Int {
        let time = time.split(separator: ":").map{ Int($0)! }
        return time[0] * 60 + time[1]
    }
    
    for record in records{
        
        let info = record.split(separator: " ").map{ String($0) }

        if info[2] == "IN" { //IN
            carMap[info[1]] = info[0]
        } else { //OUT
            //입차 시간 가져오기
            let parkIn = getTimeOfMinute(time: carMap[info[1]]!)
            let parkOut = getTimeOfMinute(time: info[0])
            let time = parkOut - parkIn

            parkingSum[info[1]] = parkingSum[info[1]] == nil ? time : parkingSum[info[1]]! + time
            
            carMap.removeValue(forKey: info[1])
        }
    }
    
    //안빠진 차 점검
    for (carId, parkIn) in carMap{
        let parkIn = getTimeOfMinute(time: parkIn)
        let parkOut = getTimeOfMinute(time: "23:59")
        let time = parkOut - parkIn
        parkingSum[carId] = parkingSum[carId] == nil ? time : parkingSum[carId]! + time
    }
    
    var ans = [Int]()
    for info in parkingSum.sorted(by: { $0.key < $1.key }){
        if info.value <= fees[0] {
            ans.append(fees[1])
        } else {
            let cost = fees[1] + Int(ceil((Float(info.value) - Float(fees[0])) / Float(fees[2]))) * fees[3]
            ans.append(cost)
        }
    }
    return ans
}
