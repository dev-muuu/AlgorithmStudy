//
//  셔틀버스.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/10/13.
//

import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    
    func convertInt(_ value: String) -> Int {
        let split = value.split(separator: ":").map{ Int($0)! }
        return split[0]*60 + split[1]
    }
    
    func convertString(_ value: Int) -> String {
        let string = [value/60, value%60].map { $0 < 10 ? "0\($0)" : "\($0)"}
        return "\(string[0]):\(string[1])"
    }
    
    let timetable = timetable.sorted(by: <).map{ convertInt($0) }
    let start = 9*60
    let end = start+(n-1)*t
    
    var ans = min(start,timetable.first!-1)
    var left = 0, right = start+(n-1)*t

    while left <= right {
        let mid = (left+right)/2
        var time = start, cnt = 0
        
        var tIndex = 0
        while tIndex < timetable.count {
            let ts = timetable[tIndex]
            if mid < ts || time > start + (n-1)*t { break }
            if ts <= time {
                cnt += 1
                tIndex += 1
            } else {
                time += t
                cnt = 0
            }
            if cnt == m {
                time += t
                cnt = 0
            }
        }
        if time <= end && cnt < m {
            ans = max(ans, mid)
            left = mid+1
        } else {
            right = mid-1
        }
    }
    return convertString(ans)
}
