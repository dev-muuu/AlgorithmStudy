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

func solution2(_ a:Int, _ b:Int) -> String {
    
    let day = ["THU","FRI","SAT","SUN","MON","TUE","WED"]
    let sum = (1..<a).reduce(b, { sum, element in
        var monthDate: Int{
            switch element{
            case 2:                 return 29
            case 1,3,5,7,8,10,12:   return 31
            default:                return 30
            }
        }
        return sum + monthDate
    })
    return day[sum % 7]
}

func reference(_ a:Int, _ b:Int) -> String {

    let w = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
    let monthDay = [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let totalDay = monthDay[0..<a-1].reduce(0, +) + b

    return w[totalDay % 7]
}
