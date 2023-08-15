//
//  행렬 테두리 회전하기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/08/15.
//

import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    
    var table = [[Int]]()
    for i in 0..<rows {
        var temp = [Int]()
        for j in 1...columns {
            temp.append(j + i*columns)
        }
        table.append(temp)
    }
    
    var ans = [Int]()
    for query in queries {
        let (x1, y1, x2, y2) = (query[0]-1, query[1]-1, query[2]-1, query[3]-1)
        
        var spin = [(Int, Int)]() //회전 좌표 리스트업
        for i in stride(from: x1, to: x2+1, by: +1){ //왼쪽
            spin.append((i, y1))
        }
        for i in stride(from: y1+1, to: y2+1, by: +1){ //아래
            spin.append((x2, i))
        }
        for i in stride(from: x2-1, to: x1-1, by: -1){ //오른쪽
            spin.append((i, y2))
        }
        for i in stride(from: y2-1, to: y1, by: -1) { //위
            spin.append((x1, i))
        }

        //구간 회전 && 최소값 찾기
        var startElement = table[spin.first!.0][spin.first!.1]
        var minValue = startElement
        for (i,coord) in spin.enumerated() {
            if i + 1 == spin.count { break }
            let nextCoord = spin[i+1]
            let nextValue = table[nextCoord.0][nextCoord.1]
            minValue = min(minValue, nextValue)
            table[coord.0][coord.1] = nextValue
        }
        table[spin.last!.0][spin.last!.1] = startElement
        ans.append(minValue)
    }
    return ans
}
