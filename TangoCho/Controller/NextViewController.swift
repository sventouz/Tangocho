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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        todoItems = realm.objects(Todo.self)
        
//        let object = todoItems[indexPath.row]
//        wordLabel.text = object.title
//        meaningLabel.text = object.meaning
//        typeLabel.text = object.type
//        exampleLabel.text = object.type
    }

}
