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
    
    var word = String()
    var meaning = String()
    var type = String()
    var example = String()
    var like = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wordLabel.text = word
        meaningLabel.text = meaning
        typeLabel.text = type
        exampleLabel.text = example
        likeLabelTo = like
        
//        if likeLabelTo == true {
//            likeLabel.setTitleColor(UIColor.red, for: .normal)
//        } else {
//            likeLabel.setTitleColor(UIColor.black, for: .normal)
//        }
    }
    
//    @IBAction func tapLike(_ sender: Any) {
//        let realm = try! Realm()
//        let todo = Todo()
//
//        if likeLabelTo == false {
//           likeLabelTo = true
//            likeLabel.setTitleColor(UIColor.red, for: .normal)
//            try! realm.write {
//                todo.like = true
//            }
//        } else {
//            likeLabelTo = false
//            likeLabel.setTitleColor(UIColor.black, for: .normal)
//            try! realm.write {
//                todo.like = false
//            }
//        }
//        print(todo.like)
//    }
    

}
