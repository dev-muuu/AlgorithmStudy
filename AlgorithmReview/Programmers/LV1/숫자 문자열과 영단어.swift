//
//  숫자 문자열과 영단어.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/18.
//

import Foundation

func solution(_ s:String) -> Int {

    //mapping array 먼저 생성
    var mapping = [String: Int]()
    mapping["zero"] = 0
    mapping["one"] = 1
    mapping["two"] = 2
    mapping["three"] = 3
    mapping["four"] = 4
    mapping["five"] = 5
    mapping["six"] = 6
    mapping["seven"] = 7
    mapping["eight"] = 8
    mapping["nine"] = 9

    var temp = ""
    let result = s.map{
        if($0.isNumber){
            return String($0)
        }

        temp.write(String($0))
        if(mapping[temp] == nil){
            return ""
        }else{
            let value = mapping[temp]!
            temp = ""
            return String(value)
        }
    }.joined()
    return Int(result)!
}

func reference(_ s:String) -> Int {
    let arr = ["zero","one","two","three","four","five","six","seven","eight","nine"]
    var str = s
    for i in 0..<arr.count {
        str = str.replacingOccurrences(of: arr[i], with: String(i))
    }
    return Int(str)!
}
