//
//  불량 사용자.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/10.
//

import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {

    let user_id = user_id.map{ Array($0) }
    let banned_id = banned_id.map{ Array($0) }
    
    var ans = Set<[Int]>()
    var visit = [Bool](repeating: false, count: user_id.count)
    
    func search(_ bIndex: Int, _ users: [Int]) {
        
        if bIndex == banned_id.count {
            ans.insert(users.sorted(by: <))
            return
        }
        
        for j in stride(from: 0, to: user_id.count, by: +1) {
            if !visit[j] && isSatisfy(j, bIndex) {
                visit[j] = true
                search(bIndex+1, users+[j])
                visit[j] = false
            }
        }
        
    }
    
    func isSatisfy(_ u: Int, _ b: Int) -> Bool {
        let user = user_id[u], ban = banned_id[b]
        if user.count != ban.count { return false }
        for i in 0..<user.count {
            if user[i] != ban[i] && ban[i] != "*"{
                return false
            }
        }
        return true
    }
    
    search(0, [])
    return ans.count
}
