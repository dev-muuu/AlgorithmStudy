//
//  2016년.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/20.
//

import Foundation

func solution(_ a:Int, _ b:Int) -> String {
    
    var dateSum = b
    for i in 1..<a{
        let monthDate: Int
        switch i{
            case 2: monthDate = 29
            case 1,3,5,7,8,10,12: monthDate = 31
            default: monthDate = 30
        }
        dateSum += monthDate
    }
    let day = ["THU","FRI","SAT","SUN","MON","TUE","WED"]
    return day[dateSum % 7]
}
