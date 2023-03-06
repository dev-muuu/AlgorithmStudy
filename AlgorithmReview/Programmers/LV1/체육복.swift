//
//  체육복.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/06.
//

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {

    var validation = [Bool](repeating: true, count: n+1)
    validation[0] = false

    var willRemove = [Int]()
    lost.forEach{
        if(!reserve.contains($0)){
            validation[$0] = false
        }else{
            willRemove.append($0)
        }
    }

    let canReserve = reserve.filter{ !willRemove.contains($0) }.sorted(by: <)

    for i in canReserve{
        if(i-1 >= 1 && !validation[i-1]){
            validation[i-1] = true
        }else if(i+1 <= n && !validation[i+1]){
            validation[i+1] = true
        }
    }
    return validation.filter{ $0 == true }.count
}
