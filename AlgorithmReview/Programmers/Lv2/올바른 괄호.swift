//
//  올바른 괄호.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/21.
//

import Foundation

func solution(_ s:String) -> Bool{
    var stack = [String]()
    for i in s{
        if(i == "("){
            stack.append(String(i))
        }else{
            if(stack.last ?? "" == "("){
                stack.removeLast()
            }else{
                return false
            }
        }
    }
    return stack.isEmpty ? true : false
}
