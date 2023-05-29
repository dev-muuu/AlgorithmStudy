//
//  합승 택시 요금.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/28.
//

import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {

    var ans = Int.max
    
    var roadMap = [[(Int, Int)]](repeating: [], count: n+1) //도착지, 가격
    for i in fares{
        roadMap[i[0]].append((i[1], i[2]))
        roadMap[i[1]].append((i[0], i[2]))
    }
    
    func dfs(_ isTogether: Bool, _ together: Int, _ aCost: Int?, _ bCost: Int?, _ visit: [Bool], _ dfsCost: [Int]){
        
        func getMinValue() -> Int{
            var minTupple = (-1, Int.max)
            for (i, c) in cost.enumerated(){
                if !visit[i] && minTupple.1 > c {
                    minTupple = (i, c)
                }
            }
            return minTupple.0
        }
        
        var visit = visit
        var cost = dfsCost
        var together = together
        var aCost: Int? = aCost, bCost: Int? = bCost
        
        while aCost == nil || bCost == nil{
            let newNode = getMinValue()
            visit[newNode] = true
            if newNode == a {
                aCost = cost[a]
            } else if newNode == b{
                bCost = cost[b]
            }
            
            //cost update
            for i in roadMap[newNode]{
                if !visit[i.0] && cost[i.0] > cost[newNode] + i.1{
                    cost[i.1] = cost[newNode] + i.1
                }
            }
            
            if !isTogether {
                continue
            }
            
            together += cost[newNode]
            dfs(false, together, aCost, bCost, visit, cost)
        }
        
        ans = min(ans, together + aCost! + bCost!)
        
    }
    
    var cost = [Int](repeating: Int.max, count: n+1)
    cost[s] = 0
    
    dfs(true, 0, nil, nil, [Bool](repeating: false, count: n+1), cost)
    
    return ans
}
