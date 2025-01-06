//
//  ViewController.swift
//  VivLogin
//
//  Created by 김범준 on 1/4/25.
//

import SwiftUI
import UIKit

class ViewController: UIViewController {
    @IBOutlet var idField: UITextField!
    
    @IBOutlet var passwordField: UITextField!
    
    @IBAction func loginButton(_ sender: Any) {
        let id = idField.text!
        let password = passwordField.text!
        
        // if -> condition 이 true 일 때 실행
//        if id.isEmpty || password.isEmpty {
//            print("계정 또는 비밀번호를 입력하세요")
//            return // Early Exit
//        }
        
        // guard -> conditon 이 거짓 일때 else 문 실행
        // 가독성 증진 (pyramid of dom)
        guard !id.isEmpty && !password.isEmpty else {
            print("계정 또는 비밀번호를 입력하세요")
            return
        }
        
        resultLabel.text = id == "viv"
            && password == "1234"
            ? "Login Success"
            : "Login Fail"
    }
    
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
