//
//  셔틀버스.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/10/13.
//

import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    
    func convert(_ time: String) -> Int {
        let split = time.split(separator: ":").map{ Int($0)! }
        return split[0] * 60 + split[1]
    }
    
    func makeAns() -> String {
        let time = [ans/60, ans%60].map{ $0 < 10 ? "0\($0)" : "\($0)" }
        return "\(time[0]):\(time[1])"
    }
    
    let timetable = timetable.map{ convert($0) }.sorted(by: <)
    let lastBus = convert("09:00") + (n-1)*t
    
    var ans = 0
    var left = convert("00:00"), right = convert("23:59")
    while left <= right {
        let mid = (left+right)/2
        var bus = (convert("09:00"), 0) //현재 셔틀 시간, 현재 탑승 인원
        var tIdx = 0
        while tIdx < timetable.count {
            if mid < timetable[tIdx] || bus.0 > lastBus{ break }
            if bus.0 >= timetable[tIdx] && bus.1 < m {
                bus.1 += 1
                if bus.1 == m {
                    bus = (bus.0 + t, 0)
                }
                tIdx += 1
            } else if bus.0 < timetable[tIdx] {
                bus = (bus.0 + t, 0)
            }
        }
        
        if mid <= lastBus && bus.0 <= lastBus && bus.1 < m { //콘이 탈 수 있는지
            ans = max(mid, ans)
            left = mid+1
        } else {
            right = mid-1
        }
    }
    return makeAns()
}
