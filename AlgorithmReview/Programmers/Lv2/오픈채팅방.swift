//
//  오픈채팅방.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/16.
//

import Foundation

func solution(_ record:[String]) -> [String] {
    
    var idMap = [String: String]()
    var roomMessage = [(Bool, String)]() //입장여부, 아이디
    for i in record{
        let info = i.split(separator: " ").map{ String($0) }
        if info[0] != "Leave" {
            idMap[info[1]] = info[2]
        }
        switch info[0]{
            case "Enter":   roomMessage.append((true, info[1]))
            case "Leave":   roomMessage.append((false, info[1]))
            default:        continue
        }
    }
    
    var ans = [String]()
    for i in roomMessage{
         if i.0 {
             ans.append("\(idMap[i.1]!)님이 들어왔습니다.")
         } else {
             ans.append("\(idMap[i.1]!)님이 나갔습니다.")
         }
    }
    return ans
}
