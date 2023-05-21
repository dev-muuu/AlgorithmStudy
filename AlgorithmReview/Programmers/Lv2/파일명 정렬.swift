//
//  파일명 정렬.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/21.
//

import Foundation

func solution(_ files:[String]) -> [String] {
    
    var split = [String: (String, Int)]() //head, num
    
    for f in files{
        let file = Array(f)
        var head = "", num = 0
        
        var index = 0, start = 0
        while index < file.count{
            if !file[index].isNumber {
                index += 1
            } else {
                break
            }
        }
        head = file[start..<index].map{ String($0) }.joined().lowercased()
        
        start = index
        while index < file.count{
            if file[index].isNumber {
                index += 1
            } else {
                break
            }
        }
        num = Int(file[start..<index].map{ String($0) }.joined())!
        
        split[f] = (head, num)
    }

    return files.sorted(by: {
        split[$0]!.0 == split[$1]!.0 ? split[$0]!.1 < split[$1]!.1 : split[$0]!.0 < split[$1]!.0
    })
}
