//
//  개인정보 수집 유효기간.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/16.
//

import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    
    let today = today.split(separator: ".")
    
    var termMapping = [String: Int]()
    for i in terms{
        let info = i.split(separator: " ")
        termMapping[String(info[0])] = Int(info[1])!
    }

    var result = [Int]()
    for (i,privacy) in privacies.enumerated(){
        let info = privacy.split(separator: " ").map{ String($0) }
        var date = info[0].split(separator: ".").map{ Int($0)! }
        
        if(date[2] == 1){
            date[2] = 28
            date[1] += termMapping[info[1]]! - 1
        }else{
            date[2] -= 1
            date[1] += termMapping[info[1]]!
        }
        
        if(date[1] > 12){
            if(date[1] % 12 == 0){
                date[0] += date[1] / 12 - 1
                date[1] = 12
            }else{
                date[0] += date[1] / 12
                date[1] %= 12
            }
        }
        
        let dateString = date.map{ $0 < 10 ? "0\($0)" : "\($0)" }.joined()
    
        if(today.joined() > dateString){
            result.append(i + 1)
        }
    }
    return result
    
}

func reference(_ today: String, _ terms: [String], _ privacies: [String]) -> [Int] {
    var answer = [Int]()
    var termDick = [String: Int]()
    let date = getDate(today)

    for s in terms {
        let term = s.components(separatedBy: " ")

        termDick[term[0]] = Int(term[1])
    }
    for i in privacies.indices {
        let privacy = privacies[i].components(separatedBy: " ")

        if getDate(privacy[0]) + (termDick[privacy[1]] ?? 0) * 28 <= date {
            answer.append(i + 1)
        }
    }
    return answer
}


private func getDate(_ today: String) -> Int {
    let date = today.split(separator: ".")
    let year = Int(date[0]) ?? 0
    let month = Int(date[1]) ?? 0
    let day = Int(date[2]) ?? 0
    return (year * 12 * 28) + (month * 28) + day
}
