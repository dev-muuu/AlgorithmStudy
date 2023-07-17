//
//  호텔 대실.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/07/17.
//

import Foundation

func solution(_ book_time:[[String]]) -> Int {
    
    func changeTime(_ time: String) -> Int{
        let time = time.split(separator: ":").map{ Int($0)! }
        return time[0] * 60 + time[1]
    }

    var bookTime = book_time.sorted(by: { $0[0] < $1[0] })
    
    var ans = [bookTime[0][1]]
    
    for j in stride(from: 1, to: bookTime.count, by: +1){
        let reserve = bookTime[j]
        var isEnter = false
        for i in 0..<ans.count {
            if changeTime(ans[i]) + 10 <= changeTime(reserve[0]){
                ans[i] = reserve[1]
                isEnter = true
                break
            }
        }
        if !isEnter {
            ans.append(reserve[1])
        }
    }
    return ans.count
}
