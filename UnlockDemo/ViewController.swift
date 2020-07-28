//
//  ViewController.swift
//  UnlockDemo
//
//  Created by 陳家豪 on 2020/7/28.
//

import UIKit

class ViewController: UIViewController {
    //4個要放選擇的文字的圖片
    @IBOutlet weak var firstWord: UIImageView!
    @IBOutlet weak var secondWord: UIImageView!
    @IBOutlet weak var thirdWord: UIImageView!
    @IBOutlet weak var fourthWord: UIImageView!
    //要操作動畫的StackView
    @IBOutlet weak var words: UIStackView!
    //放各個按鈕文字的UIImage陣列，索引值對照他們的tag，我寫成setWordsImage方法在viewDidLoad時把圖做好放進去預備
    var images = [UIImage]()
    //判斷使用者輸入第幾個數字，第四個數字時要判斷是否密碼正確
    var keyCount = 0
    //預設密碼9527不解釋
    let password = "9527"
    //用來儲存使用者輸入的文字的tag值串連的結果
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
        //因為我確定都有圖，所以後面都用!強制unwrapped
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

