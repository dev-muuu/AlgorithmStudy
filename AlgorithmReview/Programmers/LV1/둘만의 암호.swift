//
//  둘만의 암호.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/14.
//

import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    var alphabet = Array("abcdefghijklmnopqrstuvwxyz").filter{ !skip.contains($0) }
    var result = [String]()
    for i in s{
        let character = alphabet.firstIndex(of: i)!
        result.append(String(alphabet[(character + index) % alphabet.count]))
    }
    return result.joined()
}
