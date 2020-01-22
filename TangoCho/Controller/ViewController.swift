//
//  ViewController.swift
//  TangoCho
//
//  Created by higuchiryunosuke on 2020/01/10.
//  Copyright © 2020 higuchiryunosuke. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITextFieldDelegate, UISearchBarDelegate {
    
    var todoItems:Results<Todo>!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var todoCount: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //検索結果が入る配列
    var searchResult: Array<String> = []
    //検索用のタイトルのみの配列
    var items: Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        searchBar.delegate = self
        
        let realm = try! Realm()
        todoItems = realm.objects(Todo.self)
        
        //テーブルセルの左の余白を消す
        table.separatorInset = UIEdgeInsets.zero
        
        todoCount.text = String(todoItems.count)
        table.reloadData()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let object = todoItems[indexPath.row]
        cell.textLabel?.text = object.title
        cell.detailTextLabel?.text = object.meaning
        return cell
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
    
    //MARK: - 渡された文字列を含む要素を検索し、テーブルビューを再表示する
    func searchItems(searchText: String) {
        //要素を検索する
        if searchText != "" {
            searchResult = items.filter { item in
                return item.contains(searchText)
            } as Array
        } else {
            //渡された文字列が空の場合は全てを表示
            searchResult = items
        }
        print(searchText)
        print(searchResult)
        print("aaa")
        //tableViewを再読み込みする
        table.reloadData()
    }
    
    // MARK: - Search Bar Delegate Methods
    // テキストが変更される毎に呼ばれる
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //検索する
        searchItems(searchText: searchText)
    }
    
    // キャンセルボタンが押されると呼ばれる
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        view.endEditing(true)
        searchResult = items
        //tableViewを再読み込みする
        table.reloadData()
    }

    // Searchボタンが押されると呼ばれる
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        //検索する
        searchItems(searchText: searchBar.text! as String)
    }

}

