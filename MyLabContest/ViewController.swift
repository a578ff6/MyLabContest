//
//  ViewController.swift
//  MyLabContest
//
//  Created by 曹家瑋 on 2023/10/26.
//

import UIKit

class ViewController: UIViewController {

    // email輸入框
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 確認送出按鈕
    @IBAction func enterButtonTapped(_ sender: UIButton) {
        
        // 檢查是否有輸入文字，如果不為空（也就是說，有輸入內容），則繼續往下執行
        guard let email = emailTextField.text, !email.isEmpty else {
            // textFieldShakeAnimation()
            challengeTextFieldShakeAnimation()
            return
        }
        
        // 如果郵件地址不為空，則進行頁面跳轉
        performSegue(withIdentifier: "toEnteredView", sender: nil)
    }
     
    /// 文字欄位為空，進行動畫提示
    func textFieldShakeAnimation() {
        
        // 欄位向右移動 20，動畫時間為 0.2 秒
        UIView.animate(withDuration: 0.2, animations: {
            self.emailTextField.transform = CGAffineTransform(translationX: 20, y: 0)
        }) { (_) in      // 動畫完成後的回調
            // 將欄位回移到原來的位置，恢復原狀
            UIView.animate(withDuration: 0.2) {
                self.emailTextField.transform = CGAffineTransform.identity
            }
        }
    }
}


extension ViewController {
    func challengeTextFieldShakeAnimation() {
        // 持續時間為0.7秒的animateKeyframes
        UIView.animateKeyframes(withDuration: 0.6, delay: 0, options: [], animations: {
            // 第一階段:向右移動20個單位、恢復原位、向左移動20個單位
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.1) {
                self.emailTextField.transform = CGAffineTransform(translationX: 20, y: 0)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.1) {
                self.emailTextField.transform = CGAffineTransform.identity
            }
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.1) {
                self.emailTextField.transform = CGAffineTransform(translationX: -20, y: 0)
            }
            // 第一階段:向右移動20個單位、恢復原位、向左移動20個單位
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.1) {
                self.emailTextField.transform = CGAffineTransform.identity
            }
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.1) {
                self.emailTextField.transform = CGAffineTransform(translationX: 20, y: 0)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.1) {
                self.emailTextField.transform = CGAffineTransform.identity
            }
            
        }, completion: nil)
    }
}

