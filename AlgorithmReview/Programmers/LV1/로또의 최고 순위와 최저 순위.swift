//
//  로또의 최고 순위와 최저 순위.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/02.
//

import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    
    var my = lottos.sorted(by: >)
    var correction = win_nums.sorted(by: >)
    
    let zeroCount = my.filter{ $0 == 0 }.count
    
    //투포인터
    var ranking = 7
    var myIndex = 0
    var correctionIndex = 0
    while(myIndex < 6 && correctionIndex < 6){
        if(my[myIndex] == correction[correctionIndex]){
            ranking -= 1
            myIndex += 1
            correctionIndex += 1
        }else if(my[myIndex] > correction[correctionIndex]){
            myIndex += 1
        }else{
            correctionIndex += 1
        }
    }
    let high = ranking - zeroCount == 7 ? 6 : ranking - zeroCount
    let low = ranking == 7 ? 6 : ranking
    return [high, low]
}
