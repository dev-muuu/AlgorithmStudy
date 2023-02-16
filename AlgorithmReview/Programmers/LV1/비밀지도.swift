//
//  비밀지도.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/16.
//

import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    
    var answer = [String](repeating: "", count: n)
    for i in 0..<n{
        
        var firstDigit = String(arr1[i], radix: 2).map({ String($0) })
        var secondDigit = String(arr2[i], radix: 2).map({ String($0) })

        if firstDigit.count < n{
            for _ in 1...(n-firstDigit.count){
                firstDigit.insert("0", at: 0)
            }
        }
       if secondDigit.count < n{
            for _ in 1...(n-secondDigit.count){
                secondDigit.insert("0", at: 0)
            }
        }

        for j in 0..<n{
            firstDigit[j] == "1" || secondDigit[j] == "1" ? answer[i].write("#") : answer[i].write(" ")
        }
    }

    return answer
}

func reference1(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    return (0..<n).map { String(String(arr1[$0]|arr2[$0]|2<<(n - 1), radix: 2).map { $0 == "1" ? "#" : " " }[1...n]) }
}

func reference2(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {

    return (0..<n).map {
        let binary = String(arr1[$0] | arr2[$0], radix: 2)
        let padded = String(repeating: "0", count: n - binary.count) + binary
        return padded.reduce("") { $0 + ($1 == "0" ? " " : "#") }
    }
}
