//
//  2개 이하로 다른 비트.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/24.
//

import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {

    var ans = [Int64]()
    
    func isTwo(_ num: Int64) -> Bool{
        var num = num + 1
        while num % 2 == 0 {
            num /= 2
        }
        return num == 1
    }
    
    for i in numbers{
        
        let radix = String(i, radix: 2)
        var binary = Array(radix).map{ String($0) }
        
        if binary.last! == "0"{
            binary[binary.count - 1] = "1"
        } else if isTwo(i) {
            binary.removeLast()
            binary = ["10"] + binary
        } else {
            let last = binary.lastIndex(of: "0")!
            binary[last] = "1"
            binary[last + 1] = "0"
        }
        ans.append(Int64(binary.joined(), radix: 2)!)
    }
    
    return ans
}
