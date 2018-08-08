//
//  ViewController.swift
//  AppCenterTest
//
//  Created by Phoenixnet on 2018/8/6.
//  Copyright © 2018年 Dean. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let ss = "kkjsh"
        getBList()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getBList() {
        if let path = Bundle.main.path(forResource: "BList", ofType: "plist"),
            let bList = NSDictionary(contentsOfFile: path){
            
            let value = bList["BCode"]
            print("theValueIS:\(String(describing: value))")
            showAlertWithCompletion(title: "hihi", message: value! as! String) {
                
            }
        }
        
    }
    func showAlertWithCompletion(title: String, message: String, complention: @escaping () -> Void) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(
            title: "Yes",
            style: .default,
            handler: {
                (_: UIAlertAction!) -> Void in
                DispatchQueue.main.async {
                    complention()
                }
        }
        )
        alertController.addAction(okAction)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
        
    }

}

