//
//  ViewController.swift
//  QnAAnimals叢林冒險選擇題
//
//  Created by Rose on 2021/5/13.
//

import UIKit

class ViewController: UIViewController {
    
    // 題目數量
    var index = 0
    
    // 分數
    var score = 0
    
    // 正確答案
    var rightAnswer = ""
    // 題目與答案
    var questionData = [
        Question(image: "question-豬", description: "豬", option: ["馬","牛","豬","羊"], answer: "豬"),
        Question(image: "question-大象", description: "大象", option: ["大象","老鼠","河馬","猩猩"], answer: "大象"),
        Question(image: "question-火鶴", description: "火鶴", option: ["雞","獅子","火鶴","鱷魚"], answer: "火鶴"),
        Question(image: "question-牛", description: "牛", option: ["牛","鴨子","蛇","老鼠"], answer: "牛"),
        Question(image: "question-羊", description: "羊", option: ["貓","豹","雞","羊"], answer: "羊"),
        Question(image: "question-老虎", description: "老虎", option: ["犀牛","獅子","鱷魚","老虎"], answer: "老虎"),
        Question(image: "question-兔子", description: "兔子", option: ["狗","兔子","豬","貓"], answer: "兔子"),
        Question(image: "question-狗", description: "狗", option: ["狗","鴨子","貓","鱷魚"], answer: "狗"),
        Question(image: "question-浣熊", description: "浣熊", option: ["河馬","浣熊","斑馬","羊"], answer: "浣熊"),
        Question(image: "question-豹", description: "豹", option: ["狗","雞","豹","馬"], answer: "豹"),
        Question(image: "question-馬", description: "馬", option: ["馬","魚","豬","牛"], answer: "馬"),
        Question(image: "question-蛇", description: "蛇", option: ["鱷魚","蛇","貓","豹"], answer: "蛇"),
        Question(image: "question-斑馬", description: "斑馬", option: ["斑馬","羊","浣熊","兔子"], answer: "斑馬"),
        Question(image: "question-犀牛", description: "犀牛", option: ["斑馬","羊","犀牛","兔子"], answer: "犀牛")
    ]
    /*

     
     
     question-猩猩
     question-獅子
     question-貓
     question-鴨子
     question-雞
     question-鱷魚
     */
     
    // 第N題
    @IBOutlet weak var itemNumber: UILabel!
    // 分數
    @IBOutlet weak var scoreLabel: UILabel!
    // 題目圖片
    @IBOutlet weak var questionImage: UIImageView!
    
    // 選擇題按鈕
    @IBOutlet var answerButton: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //預設值
        scoreLabel.text = "0"
        itemNumber.text = "\(String(index + 1))"
        // 亂數排列
        questionData.shuffle()
        startGame()
        
        //除錯測試
        print("第1題\(rightAnswer)")
        print(questionData[index].option)
        print(questionData[index])
        //print(setTitle(questionData[1].option[0])
    }
    
    // 選擇題按鈕
    @IBAction func answerClick(_ sender: UIButton) {
        index = index + 1
        
        // 如果選擇的按鈕上的文字 等於 正確答案
        if sender.currentTitle == rightAnswer{
            //分數加10分
            score = score + 10
            //顯示到Label上
            scoreLabel.text = "\(score)"
            
        }
        
        // 在10題之內進行遊戲，或是結束遊戲計算總分 跑function
        if index < 10{
            startGame()
        } else {
            totalScore()
        }
        
        //測試
        print(index)
        print(rightAnswer)
    }
    
    // 再玩一次
    @IBAction func restartClick(_ sender: UIButton) {
        restart()
    }
    
    // 遊戲開始
    func startGame() {
        //題目
        itemNumber.text = String(index + 1)
        //問題圖片
        questionImage.image = UIImage(named: questionData[index].image)
        //正確答案
        rightAnswer = questionData[index].answer
        //4個選擇題亂數排列
        questionData[index].option.shuffle()
        
        //設定選擇題按鈕文字
        for i in 0...3 {
            answerButton[i].setTitle(questionData[index].option[i], for: .normal)
        }
    }
    // 再玩一次 內容與 viewDidLoad 一樣
    func restart() {
        score = 0
        index = 0
        itemNumber.text = "\(String(index + 1))"
        // 亂數排列
        scoreLabel.text = "0"
        questionData.shuffle()
        startGame()
    }
    
    // 彈跳視窗訊息Function
    func alertMessage(replaceTitle: String, replaceMessage: String, replaceBtnTxt: String) {
        let alertController = UIAlertController (
            title: replaceTitle, message: replaceMessage, preferredStyle: .alert)
        let alertBtn = UIAlertAction(
            title: replaceBtnTxt, style: .default, handler: {(_)in
                self.restart()
            })
        alertController.addAction(alertBtn)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // 計算總分
    func totalScore() {
        if score >= 90 && score <= 100 {
            alertMessage(replaceTitle: "總分\(score)", replaceMessage: "你就是動物達人！", replaceBtnTxt: "不不玩了實在太簡單")
        }
        else if score >= 60 && score < 90 {
            alertMessage(replaceTitle: "總分\(score)", replaceMessage: "有機會多認識一點動物喔！", replaceBtnTxt: "我要再玩一次")
        }
        else if score >= 63 && score < 60 {
            alertMessage(replaceTitle: "總分\(score)", replaceMessage: "你看顧的動物太少囉！", replaceBtnTxt: "我要再玩一次")
        }
        else {
            alertMessage(replaceTitle: "總分\(score)", replaceMessage: "你好像沒看過動物呢", replaceBtnTxt: "我要再玩一次")
        }
    }
    
    


}

