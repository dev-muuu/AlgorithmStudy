//
//  JadenCase 문자열 만들기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/20.
//

import Foundation

func solution(_ s:String) -> String {

    var result = ""
    var isBlank = true
    for i in s{
        if(i != " " && isBlank){
            result.write("\(i.uppercased())")
            isBlank = false
            continue
        }

        if(i == " "){
            isBlank = true
        }
        result.write("\(i.lowercased())")
    }
    return result
}
