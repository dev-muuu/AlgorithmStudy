//
//  문자열 내 마음대로 정렬하기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/16.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12915

import Foundation

func solution(_ strings:[String], _ n:Int) -> [String] {
    return strings.sorted(by: {
        let a = Array($0)
        let b = Array($1)
        return a[n] == b[n] ? $0 < $1 : a[n] < b[n]
    })
}
