//
//  기사단원의 무기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/07.
//

import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {

    //약수 개수 구하기
    var divisor = [Int](repeating: 1, count: number+1)
    for i in 1...number{
        var element = i
        var index = 2
        while(element * index <= number){
            divisor[element * index] += 1
            index += 1
        }
    }

    return divisor[1...number].reduce(0){
        $1 > limit ? $0 + power : $0 + $1
    }
}
