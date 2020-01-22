//
//  addViewController.swift
//  TangoCho
//
//  Created by higuchiryunosuke on 2020/01/10.
//  Copyright © 2020 higuchiryunosuke. All rights reserved.
//

import UIKit
import RealmSwift

class addViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textBox: UITextField!
    @IBOutlet weak var textMeaningBox: UITextField!
    @IBOutlet weak var error: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textBox.delegate = self
        error.text = ""
    }
    
    @IBAction func addButton(_ sender: Any) {
        
        let realm = try! Realm()
        let todo = Todo()
        if textBox.text! != "" && textMeaningBox.text! != "" {
            todo.title = textBox.text!
            todo.meaning = textMeaningBox.text!
            try! realm.write {
                realm.add(todo)
            }
            error.text = ""
            self.navigationController?.popViewController(animated: true)
        } else {
            error.text = "正しく入力してください"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textBox.resignFirstResponder()
        return true
    }
    
}
