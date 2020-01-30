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
        
        let realm = try! Realm()
        todoItems = realm.objects(Todo.self)
        
        wordLabel.text = word
        meaningLabel.text = meaning
        typeLabel.text = type
        exampleLabel.text = example
        likeLabelTo = like
    }
    
    if likeLabelTo == false {
       likeLabelTo = true
    } else {
        likeLabelTo = false
    }

}
