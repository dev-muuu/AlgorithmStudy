//
//  양궁대회.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/08/23.
//

import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    
    var ans = ([Int](repeating: 0, count: 11), 0)
    
    func make(_ hit: [Int], _ index: Int, _ remain: Int, _ score: (Int, Int)){
        if hit.count == 10 {
            let hit = hit + [remain]
            if ans.1 < score.0 - score.1 {
                ans = (hit, score.0 - score.1)
            } else if ans.1 == score.0 - score.1 {
                for i in stride(from: 10, to: -1, by: -1){
                    if ans.0[i] != hit[i] {
                        if ans.0[i] < hit[i] {
                            ans.0 = hit
                        }
                        break
                    }
                }
            }
            return
        }
        
        //화살 개수: 어피치의 개수 + 1 또는 0으로 설정
        let op = info[index] + 1
        if remain - op >= 0 {
            make(hit + [op], index+1, remain-op, (score.0+10-index,score.1))
        }
        let update = op - 1 == 0 ? 0 : 10-index
        make(hit + [0], index+1, remain, (score.0, score.1 + update))
    }

    make([], 0, n, (0,0))
    return ans.1 == 0 ? [-1] : ans.0
}
