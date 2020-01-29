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
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var exampleField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textBox.delegate = self
        textMeaningBox.delegate = self
        typeField.delegate = self
        exampleField.delegate = self
        error.text = ""
    }
    
    @IBAction func addButton(_ sender: Any) {
        
        let realm = try! Realm()
        let todo = Todo()
        if textBox.text! != "" && textMeaningBox.text! != "" && typeField.text! != "" {
            todo.title = textBox.text!
            todo.meaning = textMeaningBox.text!
            todo.type = typeField.text!
            todo.example = typeField.text!
            todo.like = false
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
        self.textMeaningBox.resignFirstResponder()
        self.typeField.resignFirstResponder()
        self.exampleField.resignFirstResponder()
        return true
    }
    
}
