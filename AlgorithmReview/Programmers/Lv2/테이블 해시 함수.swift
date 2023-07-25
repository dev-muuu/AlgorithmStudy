//
//  테이블 해시 함수.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/07/25.
//

import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    let col = col-1
    var data = data.sorted(by: { $0[col] == $1[col] ? $0[0] > $1[0] : $0[col] < $1[col]})
    let S_i = (1...data.count).map{ index in data[index-1].reduce(0){ $0 + $1 % index }}
    return (row_begin-1...row_end-1).reduce(0) { $0 ^ S_i[$1] }
}
