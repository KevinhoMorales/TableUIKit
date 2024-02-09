//
//  ViewController.swift
//  TableUIKit
//
//  Created by Kevin Morales on 9/2/24.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        title = "UI Kit"
        navigationController?.navigationBar.prefersLargeTitles = true
        setUpCell()
        setUpData()
    }

    private func setUpData() {
        for element in 0..<20 {
            items.append("\(element)")
        }
        reloadData()
    }
    
    private func reloadData() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.tableView.reloadData()
        }
    }
    
    private func setUpCell() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = "Item No. \(item)"
        return cell
    }
}

