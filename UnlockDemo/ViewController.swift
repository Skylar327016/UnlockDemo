//
//  ViewController.swift
//  UnlockDemo
//
//  Created by 陳家豪 on 2020/7/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstWord: UIImageView!
    @IBOutlet weak var secondWord: UIImageView!
    @IBOutlet weak var thirdWord: UIImageView!
    @IBOutlet weak var fourthWord: UIImageView!
    var keyCount = 0
    let password = "9527"
    var input = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func keyIn(_ sender: UIButton) {
        keyCount += 1
        if keyCount == 1{
            if let word1 = UIImage(named: "一"){
                firstWord.image = word1
                let inputNumber = sender.tag
                input += "\(inputNumber)"
                
            }
        }else if keyCount == 2{
            if let word2 = UIImage(named: "個"){
                secondWord.image = word2
                let inputNumber = sender.tag
                input += "\(inputNumber)"
            }
        }else if keyCount == 3{
            if let word3 = UIImage(named: "字"){
                thirdWord.image = word3
                let inputNumber = sender.tag
                input += "\(inputNumber)"
            }
        }else{
            if let word4 = UIImage(named: "湖"){
                let inputNumber = sender.tag
                input += "\(inputNumber)"
                if input != password{
                    restart()
                }else{
                    fourthWord.image = word4
                }
                
            }
        }
    }
    
    @IBAction func reset(_ sender: UIButton) {
        restart()
    }
    func restart(){
        firstWord.image = nil
        secondWord.image = nil
        thirdWord.image = nil
        fourthWord.image = nil
        keyCount = 0
        input = ""
    }
    
    
}

