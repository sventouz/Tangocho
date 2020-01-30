//
//  ViewController.swift
//  TangoCho
//
//  Created by higuchiryunosuke on 2020/01/10.
//  Copyright © 2020 higuchiryunosuke. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    var todoItems:Results<Todo>!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var todoCount: UILabel!
    
    var word = ""
    var meaning = ""
    var type = ""
    var example = ""
    var like = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        
        let realm = try! Realm()
        todoItems = realm.objects(Todo.self)
        
        table.register (UINib(nibName: "CustomCell", bundle: nil),forCellReuseIdentifier:"reusableCell")
        
        //テーブルセルの左の余白を消す
        table.separatorInset = UIEdgeInsets.zero
        
        todoCount.text = String(todoItems.count)
        table.reloadData()
        print(todoItems)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        todoCount.text = String(todoItems.count)
        table.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath) as! CustomCell
        let object = todoItems[indexPath.row]
        cell.wordLabel.text = object.title
        cell.meaningLabel.text = object.meaning
        cell.typeLabel.text = object.type
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 100
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let object = todoItems[indexPath.row]
        word = object.title
        meaning = object.meaning
        type = object.type
        example = object.example
        like = object.like
        performSegue(withIdentifier: "toNextViewController", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toNextViewController") {
            let nextVC: NextViewController = (segue.destination as? NextViewController)!
            nextVC.word = word
            nextVC.meaning = meaning
            nextVC.type = type
            nextVC.example = example
            nextVC.like = like
        }
    }
    
    //削除機能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteTodo(at:indexPath.row)
            table.reloadData()
        }
        todoCount.text = String(todoItems.count)
    }
    func deleteTodo(at index: Int) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(todoItems[index])
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

