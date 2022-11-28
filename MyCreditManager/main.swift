//
//  main.swift
//  MyCreditManager
//
//  Created by 이승아 on 2022/11/28.
//

import Foundation

var studentList = [Student]()

print("원하는 기능을 입력해 주세요")

var ended = false
while !ended {
  print("1: 학생추가, 2: 학생삭제 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
  if let response = readLine() {
    if response == "1"  {
      print("추가할 학생의 이름을 입력해 주세요.")
      if let name = readLine(), name.count > 0 {
        if studentList.filter({ $0.name == name }).count > 0 {
          print("\(name)은 존재하는 학생입니다. 추가하지 않습니다.")
        } else {
          let student = Student(name: name)
          studentList.append(student)
          print("\(name) 학생을 추가했습니다.")
        }
        
      } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
      }
    } else if response == "2" {
      print("삭제할 학생의 이름을 입력해 주세요.")
      if let name = readLine(), name.count > 0 {
        if studentList.filter({ $0.name == name }).count > 0 {
          for (index, value) in studentList.enumerated() {
            if value.name == name {
              studentList.remove(at: index)
              break
            }
          }
          print("\(name) 학생을 삭제하였습니다.")
        } else {
          print("\(name) 학생을 찾지 못헀습니다.")
        }
        
      } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
      }
    } else if response == "3" {
      print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
      if let scoreInput = readLine(), scoreInput.count > 0 {
        let score = scoreInput.components(separatedBy: " ")
        var student = studentList.filter({ $0.name == score[0] })
        if score.count == 3 {
          if student.count > 0, (score[2] == "A+" || score[2] == "A" || score[2] == "B+" || score[2] == "B" || score[2] == "C+" || score[2] == "C" || score[2] == "D+" || score[2] == "D" || score[2] == "F") {
            student[0].score.updateValue(score[2], forKey: score[1])
            for (index, value) in studentList.enumerated() {
              if value.name == score[0] {
                studentList[index] = student[0]
              }
            }
            
            print("\(score[0]) 학생의 \(score[1]) 과목이 \(score[2])로 추가(변경)되었습니다.")
          } else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
          }
        } else {
          print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }
      } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
      }
      
    } else if response == "4" {
      print("성적을 추가할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift")
      
      if let scoreInput = readLine(), scoreInput.count > 0 {
        let score = scoreInput.components(separatedBy: " ")
        var student = studentList.filter({ $0.name == score[0] })
        
        if score.count == 2 {
          if student.count > 0 {
            student[0].score.removeValue(forKey: score[1])
            print("\(score[0]) 학생의 \(score[1]) 과목의 성적이 삭제되었습니다.")
          } else {
            print("\(score[0]) 학생을 찾지 못했습니다.")
          }
        } else {
          print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }
        
      } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
      }
      
    } else if response == "5" {
      print("평점을 알고싶은 학생의 이름을 입력해주세요.")
      if let name = readLine(), name.count > 0 {
        var student = studentList.filter({ $0.name == name })
        if student.count > 0 {
          student[0].printScore()
        } else {
          print("\(name) 학생을 찾지 못헀습니다.")
        }
      } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
      }
    }else if response == "X" {
      ended = true
    } else {
      print("뭔가 입력이 잘못되었습니다. 1~5사이의 숫자 혹은 X를 입력해 주세요.")
    }
    
  } else {
    print("뭔가 입력이 잘못되었습니다. 1~5사이의 숫자 혹은 X를 입력해 주세요.")
  }
}
