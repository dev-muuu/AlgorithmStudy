//
//  숫자 짝꿍.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/06.
//

import Foundation

func solution(_ X:String, _ Y:String) -> String {

    var xCount = [Int](repeating: 0, count: 10)
    var yCount = [Int](repeating: 0, count: 10)

    for i in X{
        let index = Int(String(i))!
        xCount[index] += 1
    }

    for i in Y{
        let index = Int(String(i))!
        yCount[index] += 1
    }

    var result = ""
    for i in stride(from: 9, to: -1, by: -1){
        if(xCount[i] != 0 && yCount[i] != 0){
            if(i == 0 && result.isEmpty){
                result = "0"
            }else{
                result.write(String(repeating: String(i), count: min(xCount[i], yCount[i])))
            }
        }
    }

    return result.isEmpty ? "-1" : result
}
