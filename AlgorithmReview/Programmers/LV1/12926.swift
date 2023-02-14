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


func reference1(_ s:String, _ n:Int) -> String {
    return s.utf8.map {
        var code = Int($0)
        switch code {
            case 65...90:
                code = (code + n - 65) % 26 + 65
            case 97...122:
                code = (code + n - 97) % 26 + 97
            default:
                break
        }
        return String(UnicodeScalar(code)!)
    }.joined()
}

func reference2(_ s:String, _ n:Int) -> String {
    let alphabets = "abcdefghijklmnopqrstuvwxyz".map { $0 }
    return String(s.map {
        guard let index = alphabets.firstIndex(of: Character($0.lowercased())) else { return $0 }
        let letter = alphabets[(index + n) % alphabets.count]
        return $0.isUppercase ? Character(letter.uppercased()) : letter
    })
}
