//
//  파일명 정렬.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/21.
//

import Foundation

func solution(_ files:[String]) -> [String] {

    var file = [(id: Int, head: String, number: Int)]()
    for (i, value) in files.enumerated() {
        
        //head
        let fileArray = Array(value).map{ String($0).lowercased() }
        let headEnd = fileArray.firstIndex(where: { Character($0).isNumber })!
        let head = fileArray[0..<headEnd].joined()
        
        //number
        var numberEnd: Int! = fileArray[headEnd...].firstIndex(where: { !Character($0).isNumber })
        if numberEnd == nil {
            numberEnd = fileArray.count
        }
        let number = Int(fileArray[headEnd..<numberEnd].joined())!
        
        file.append((i, head, number))
    }
    
    let sortFile = file
    .sorted(by: { $0.number < $1.number })
    .sorted(by: { $0.head < $1.head })
    
    return sortFile.map{ files[$0.id] }
}
