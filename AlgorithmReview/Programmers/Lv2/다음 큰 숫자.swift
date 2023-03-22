//
//  다음 큰 숫자.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/22.
//

import Foundation

func solution(_ n:Int) -> Int{
    var nOneCount = String(n, radix:2).filter{ $0 == "1" }.count
    var value = n+1
    while(true){
        let radix = String(value, radix:2)
        let oneCount = radix.filter{ $0 == "1"}.count
        if(oneCount == nOneCount){
            break
        }
        value += 1
    }
    return value
}
