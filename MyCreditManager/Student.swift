//
//  Student.swift
//  MyCreditManager
//
//  Created by 이승아 on 2022/11/28.
//

import Foundation

struct Student {
  var name: String
  
  var score: [String:String] = [:]
  
  func addScore() {
    
  }
  
  func printScore() {
    var totalScore = 0.0
    for value in score {
      if value.value == "A+" {
        totalScore += 4.5
      } else if value.value == "A" {
        totalScore += 4.0
      } else if value.value == "B+" {
        totalScore += 3.5
      } else if value.value == "B" {
        totalScore += 3.0
      } else if value.value == "C+" {
        totalScore += 2.5
      } else if value.value == "C" {
        totalScore += 2
      } else if value.value == "D+" {
        totalScore += 1.5
      } else if value.value == "D" {
        totalScore += 1
      } else if value.value == "F" {
        totalScore += 0
      }
      print("\(value.key) : \(value.value)")
    }
    
    print("평점 : \(totalScore / Double(score.count))")
  }
}
