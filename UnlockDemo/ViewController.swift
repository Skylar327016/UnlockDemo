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
    @IBOutlet weak var words: UIStackView!
    let buttons = [UIButton]()
    var images = [UIImage]()
    var keyCount = 0
    let password = "9527"
    var input = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setWordsImage()
        
    }
    @IBAction func keyIn(_ sender: UIButton) {
        keyCount += 1
        if keyCount == 1{
            firstWord.image = images[sender.tag]
            input += "\(sender.tag)"
        }else if keyCount == 2{
            secondWord.image = images[sender.tag]
            input += "\(sender.tag)"
        }else if keyCount == 3{
            thirdWord.image = images[sender.tag]
            input += "\(sender.tag)"
        }else{
            fourthWord.image = images[sender.tag]
            input += "\(sender.tag)"
            if input != password{
                animationForFailure()
            }else{
                actionForSuccess()
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
    
    func animationForFailure(){
        let animation = UIViewPropertyAnimator(duration: 0.8, dampingRatio: 0.1, animations: {
            self.words.center.x += 30
        })
        animation.addCompletion({_ in
            self.restart()
        })
        animation.startAnimation()
        
    }
    func actionForSuccess(){
        self.performSegue(withIdentifier: "go", sender: self)

    }
    func setWordsImage(){
        images.append(UIImage(named: "義")!)
        images.append(UIImage(named: "義")!)
        images.append(UIImage(named: "字")!)
        images.append(UIImage(named: "碰")!)
        images.append(UIImage(named: "氣")!)
        images.append(UIImage(named: "個")!)
        images.append(UIImage(named: "糊")!)
        images.append(UIImage(named: "湖")!)
        images.append(UIImage(named: "意")!)
        images.append(UIImage(named: "一")!)
 
    }
}

