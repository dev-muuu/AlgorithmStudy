//
//  오픈채팅방.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/16.
//

import Foundation

func solution(_ record:[String]) -> [String] {
    
    var user = [String:String]() //id : nickname
    var log = [(id: String, isEnter: Bool)]()
    
    for r in record {
        
        let split = r.split(separator: " ").map{ String($0) }
        
        switch split[0] {
            
            case "Enter":
            user[split[1]] = split[2]
            log.append((split[1], true))
            
            case "Leave":
            log.append((split[1], false))
            
            case "Change":
            user[split[1]] = split[2]
            
            default: break
        }
    }
    
    return log.map{
        let explain = $0.isEnter ? "님이 들어왔습니다." : "님이 나갔습니다."
        return user[$0.id]! + explain
    }
}
