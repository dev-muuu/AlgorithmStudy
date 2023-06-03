//
//  큰 수 찾기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/03.
//

import Foundation

func solution(_ number:String, _ k:Int) -> String {

    var stack = [String]()
    for (i, element) in number.enumerated(){
        let num = String(element)
        while stack.count > i - k && !stack.isEmpty && stack.last! < num {
            stack.removeLast()
        }
        stack.append(num)
    }

    if stack.count > number.count - k{ //stack 크기가 초과한 경우, 제거
        stack.removeLast()
    }
    return stack.joined()
}
