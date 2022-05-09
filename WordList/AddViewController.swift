//
//  AddViewController.swift
//  WordList
//
//  Created by 工藤彩名 on 2022/05/08.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    
    var wordArray: [Dictionary<String, String>] = []
    
    let saveData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if saveData.array(forKey: "WORD") != nil {
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        }

    }
    
    @IBAction func saveWord() {
        if englishTextField.text == ""{
            let alert = UIAlertController(
                title: "確認",
                message: "英語を入力してください！",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(
                title: "わかった",
                style: .cancel,
                handler: nil
            ))
            present(alert, animated: true, completion: nil)
        } else if japaneseTextField.text == "" {
            let alert = UIAlertController(
                title: "確認",
                message: "日本語を入力してください！",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(
                title: "わかった",
                style: .cancel,
                handler: nil
            ))
            present(alert, animated: true, completion: nil)
        } else {
            
            let wordDictionary = ["english": englishTextField.text!, "japanese": japaneseTextField.text!]
            
            wordArray.append(wordDictionary)
            saveData.set(wordArray, forKey: "WORD")
            
            let alert = UIAlertController(
                title: "保存完了",
                message: "単語の登録が完了しました",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            ))
            present(alert, animated: true, completion: nil)
            englishTextField.text = ""
            japaneseTextField.text = ""
        }
    }
    


}
