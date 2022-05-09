//
//  QuestionViewController.swift
//  WordList
//
//  Created by 工藤彩名 on 2022/05/08.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var nextButton: UIButton!
    
    // 回答したか、次の質問へ行くかの判定
    var isAnswerd: Bool = false
    // UserDefalutsからとる配列
    var wordArray: [Dictionary<String, String>] = []
    // 現在の回答数
    var nowNumber: Int = 0
    let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        answerLabel.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        // 問題の配列をシャッフル
        wordArray.shuffle()
        questionLabel.text = wordArray[nowNumber]["english"]
    }
    
    @IBAction func nextbuttonTapped() {
        // 回答したか
        if isAnswerd {
            // 次の問題へ
            nowNumber += 1
            answerLabel.text = ""
            
            // 次の問題を表示するか
            if nowNumber < wordArray.count {
                // 次の問題を表示
                questionLabel.text = wordArray[nowNumber]["english"]
                // isAnswerdをfalseにする
                isAnswerd = false
                // ボタンのタイトルを変更
                nextButton.setTitle("答えを表示", for: .normal)

            } else {
                nowNumber = 0
                performSegue(withIdentifier: "toFinishView", sender: nil)
            }
        } else {
            // 答えを表示
            answerLabel.text = wordArray[nowNumber]["japanese"]
            // isAnswerdをtrueにする
            isAnswerd = true
            nextButton.setTitle("次へ", for: .normal)
        }
    }
    

  

}
