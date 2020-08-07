//
//  ViewController.swift
//  AkiosTask7
//
//  Created by Nekokichi on 2020/08/06.
//  Copyright © 2020 Nekokichi. All rights reserved.
//
/*
 タブ１：足し算
    背景：赤
 タブ２：引き算
    背景：黄緑
 ？足し算、引き算の切り替え方
 キーボードを閉じる
 
 */

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var tabbar: UITabBar!
    @IBOutlet private weak var valueField1: UITextField!
    @IBOutlet private weak var valueField2: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!
    
    //足し算か引き算を区別
    private enum Operation {
        case plus
        case minus
    }
    private var operation:Operation = .plus
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabbar.delegate = self
        //初期タブ
        tabbar.selectedItem = tabbar.items![0]
        //初期の背景色
        self.view.backgroundColor = .orange
    }
    
    @IBAction func calculation(_ sender: Any) {
        guard let value1 = Int(valueField1.text!), let value2 = Int(valueField2.text!) else {
            self.alert(title: "課題7", message: "数値を入力してください")
            return
        }
        if operation == .plus {
            resultLabel.text = "\(value1 + value2)"
        }
        if operation == .minus {
            resultLabel.text = "\(value1 - value2)"
        }
    }
    
    func alert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}

extension ViewController:UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.title {
        case "plus":
            self.view.backgroundColor = .orange
            operation = .plus
        case "minus":
            self.view.backgroundColor = .green
            operation = .minus
        default:break
        }
    }
}

extension ViewController:UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
