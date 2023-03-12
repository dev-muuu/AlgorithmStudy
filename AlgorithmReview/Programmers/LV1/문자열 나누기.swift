//
//  문자열 나누기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/12.
//

import Foundation

func solution(_ s:String) -> Int {

    var result = 1
    let string = Array(s)
    var standard = string.first!

    var index = 1
    var count = (1,0)
    while(index < s.count){

        if(string[index] == standard){
            count.0 += 1
        }else{
            count.1 += 1
        }

        if(count.0 == count.1 && index < s.count - 1){
            count = (1,0)
            result += 1
            standard = string[index+1]
            index += 2
            continue
        }
        index += 1
    }
    return result
}
