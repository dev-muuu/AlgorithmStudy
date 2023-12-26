//
//  압축.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/11.
//

import Foundation

func solution1(_ msg:String) -> [Int] {
    
    var dict = [String:Int]()
    for i in 0..<26 {
        dict[String(UnicodeScalar(65+i)!)] = i+1
    }
    
    var ans = [Int]()
    let msg = Array(msg).map{ String($0) }
    
    var index = 0
    while index < msg.count {
        
        //현재 입력 문자열 찾기
        
        var w = (index, msg[index])
        
        while isSafeRange() && dict[nextKey()] != nil {
            w.0 += 1
            w.1 += msg[w.0]
        }
        
        ans.append(dict[w.1]!)
        
        //다음 글자 사전에 추가
        
        if isSafeRange() {
            dict[nextKey()] = dict.count + 1
        }
        
        index = w.0 + 1
        
        func isSafeRange() -> Bool {
            w.0 + 1 < msg.count
        }
        
        func nextKey() -> String {
            w.1 + msg[w.0+1]
        }
    }
    
    return ans
}

func solution2(_ msg:String) -> [Int] {
    
    var map = [String: Int]()
    for i in 1...26 {
        map[String(UnicodeScalar(64+i)!)] = i
    }
    
    let msg = Array(msg).map{ String($0) }
    
    var result = [Int]()
    var index = 0
    while index < msg.count {
        // 현재 입력
        var w = ""
        var endIndex = index
        while endIndex < msg.count && map[msg[index..<endIndex+1].joined()] != nil {
            w = msg[index..<endIndex+1].joined()
            endIndex += 1
        }
        // 사전 추가
        if endIndex < msg.count {
            map[msg[index..<endIndex+1].joined()] = map.count + 1
        }
        // 출력
        result.append(map[w]!)
        
        index = endIndex
    }
    
    return result
}
