//
//  12926.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/14.
//

import Foundation

func solution(_ s:String, _ n:Int) -> String {
    
    //알파벳은 26개
    //A: 65
    //Z: 90
    //a: 97
    //z: 122
    
    var ans = ""
    for i in s{
        if(i == " "){
            ans.write(" ")
            continue
        }
        
        var value = Int(UnicodeScalar("\(i)")!.value)
        
        if(i >= "A" && i <= "Z"){
            value -= 65
            value = (value + n) % 26
            ans.write(String(UnicodeScalar(65 + value)!))
        }else{
            value -= 97
            value = (value + n) % 26
            ans.write(String(UnicodeScalar(97 + value)!))
        }
    }
    
    return ans
}
