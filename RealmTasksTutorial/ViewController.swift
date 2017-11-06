//
//  ViewController.swift
//  RealmTasksTutorial
//
//  Created by Goodnews on 2017. 11. 6..
//  Copyright © 2017년 goodnews. All rights reserved.
//

import UIKit
import RealmSwift

//
// MARK: Model
//

final class TaskList: Object {
	@objc dynamic var text = ""
	@objc dynamic var id = ""
	let items = List<Task>()
	
	override static func primaryKey() -> String? {
		return "id"
	}
}

final class Task: Object {
	@objc dynamic var text = ""
	@objc dynamic var completed = false
}


class ViewController: UITableViewController {
	
	var items = List<Task>()
	var notificationToken: NotificationToken!
	var realm: Realm!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
		
	}
	
	func setupUI() {
		title = "My Tasks"
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))

	}
	
	func setupRealm() {
		// Log in existing user with username and password
		let username = "test"  // <--- Update this
		let password = "test"  // <--- Update this
	}
	
	deinit {
		notificationToken.invalidate()
	}
	
	//
	// MARK: TableView
	//
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		
		let item = items[indexPath.row]
		
		cell.textLabel?.text = item.text
		cell.textLabel?.alpha = item.completed ? 0.5 : 1
		
		return cell
	}
	
	// MARK: Functions
	
	@objc func add() {
		let alertController = UIAlertController(title: "New Task", message: "Enter Task Name", preferredStyle: .alert)
		var alertTextField: UITextField!
		alertController.addTextField { textField in
			alertTextField = textField
			textField.placeholder = "Task Name"
		}
		alertController.addAction(UIAlertAction(title: "Add", style: .default) { _ in
			guard let text = alertTextField.text , !text.isEmpty else { return }
			
			self.items.append(Task(value: ["text": text]))
			self.tableView.reloadData()
		})
		present(alertController, animated: true, completion: nil)
	}
	
}
