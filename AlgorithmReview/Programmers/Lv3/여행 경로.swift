//
//  여행 경로.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/21.
//

import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    
    let tickets = tickets.sorted(by: { $0[1] < $1[1] })

    var airline = [String: [(String, Int)]]() //도착지, 인덱스
    for (id, i) in tickets.enumerated(){
        airline[i[0]] = airline[i[0]] == nil ? [(i[1], id)] : airline[i[0]]! + [(i[1], id)]
    }
    
    var visit = [Bool](repeating: false, count: tickets.count)
    var ans = [String]()
    func dfs(node: String, order: [String]){
        
        if order.count == tickets.count{
            ans = order; return
        } else if !ans.isEmpty || airline[node] == nil{
            return
        }
        
        for i in airline[node]!{
            if !visit[i.1] {
                visit[i.1] = true
                dfs(node: i.0, order: order + [i.0])
                visit[i.1] = false
            }
        }
        
    }
    dfs(node: "ICN", order: [])
    return ["ICN"] + ans
}
