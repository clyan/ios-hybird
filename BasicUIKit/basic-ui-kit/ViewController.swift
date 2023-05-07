//
//  ViewController.swift
//  basic-ui-kit
//
//  Created by yanwenyao on 2023/5/7.
//

import UIKit

class ViewController: UIViewController {
    
    /// 关联控件
    /// 表示关联可视化布局中控件的变量
    @IBOutlet weak var titleView: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onReset(_ sender: UIButton) {
        print("onRest")
    }
    
    @IBAction func onLogin(_ sender: UIButton) {
        print("onLogin")
        jumpSecond()
    }
    
    func jumpSecond() {
        let secondController = storyboard!.instantiateViewController(withIdentifier: "Second")
        secondController.modalPresentationStyle = .fullScreen
       present(secondController, animated: true)
    }
}

