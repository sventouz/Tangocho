//
//  NextViewController.swift
//  TangoCho
//
//  Created by higuchiryunosuke on 2020/01/29.
//  Copyright © 2020 higuchiryunosuke. All rights reserved.
//

import UIKit
import RealmSwift

class NextViewController: UIViewController {
    
    var todoItems:Results<Todo>!
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var meaningLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var likeLabel: UIButton!
    @IBOutlet weak var exampleLabel: UILabel!
    
    var likeLabelTo: Bool?
    
    var num = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        todoItems = realm.objects(Todo.self)
        
        let object = todoItems[num]
        
        wordLabel.text = object.title
        meaningLabel.text = object.meaning
        typeLabel.text = object.type
        exampleLabel.text = object.example
        likeLabelTo = object.like
        
        if likeLabelTo == true {
            likeLabel.setTitleColor(UIColor.red, for: .normal)
        } else {
            likeLabel.setTitleColor(UIColor.black, for: .normal)
        }
    }
    
    @IBAction func tapLike(_ sender: Any) {
        let realm = try! Realm()
        todoItems = realm.objects(Todo.self)
        let object = todoItems[num]

        if likeLabelTo == false {
           likeLabelTo = true
            likeLabel.setTitleColor(UIColor.red, for: .normal)
            try! realm.write {
                object.like = true
            }
        } else {
            likeLabelTo = false
            likeLabel.setTitleColor(UIColor.black, for: .normal)
            try! realm.write {
                object.like = false
            }
        }
    }
    

}
