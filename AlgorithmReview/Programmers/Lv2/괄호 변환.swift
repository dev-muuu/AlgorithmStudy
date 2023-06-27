//
//  괄호 변환.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/27.
//

import Foundation

func solution(_ p:String) -> String {

    let p = Array(p).map{ String($0) }

    func makeBalance(_ string: [String]) -> String{
        if string.count == 2 {
            return ""
        }
        var temp = [String]()
        for i in 1..<string.count-1{
            if string[i] == "(" {
                temp.append(")")
            }else {
                temp.append("(")
            }
        }
        return temp.joined()
    }
    
    func balance(_ string: [String]) -> String{
        
        var count = (left: 0, right: 0)
        var index = 0
        var isBalance = true
        var stack = [String]()
        repeat{
            if string[index] == "(" {
                count.left += 1
                stack.append("(")
            } else {
                count.right += 1
                if stack.last == "("{
                    stack.removeLast()
                } else {
                    isBalance = false
                }
            }
            index += 1
        } while count.left != count.right && index < string.count
        
        let right = index == string.count ? "" : balance(Array(string[index..<string.count]))
        if isBalance {
            return string[0..<index].joined() + right
        } else {
            let reverseLeft = makeBalance(Array(string[0..<index]))
            return "(\(right))\(reverseLeft)"
        }
    }
    return balance(p)
}
