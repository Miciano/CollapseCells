//
//  ViewController.swift
//  CollapseCells
//
//  Created by Fabio Miciano on 19/09/19.
//  Copyright © 2019 Fabio Miciano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    private var dataSource: [Information] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeDataSource()
        self.setTable()
    }

    private func makeDataSource() {
        let info0 = Information(title: "Mussum Ipsum", description: "cacilds vidis litro abertis. Nullam volutpat risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio. Admodum accumsan disputationi eu sit. Vide electram", expandle: false)
        let info1 = Information(title: "Quem num gosta di mim", description: "Quem manda na minha terra sou euzis! Casamentiss faiz malandris se pirulitá. Tá deprimidis, eu conheço uma cachacis que pode alegrar sua vidis.", expandle: false)
        let info2 = Information(title: "Si u mundo tá muito paradis?", description: "Toma um mé que o mundo vai girarzis! Quem num gosta di mim que vai caçá sua turmis! Suco de cevadiss deixa as pessoas mais interessantis. A ordem dos tratores não altera o pão duris. Admodum accumsan disputationi eu sit. Vide electram ", expandle: false)
        
        dataSource = [info0, info1, info2]
    }
    
    private func setTable() {
        self.table.register(UINib(nibName: "CollapseViewCell", bundle: Bundle.main), forCellReuseIdentifier: "collapseCell")
        self.table.dataSource = self
        self.table.delegate = self
        
        self.table.estimatedRowHeight = 80
        self.table.rowHeight = UITableView.automaticDimension
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: "collapseCell") as? CollapseViewCell else { return UITableViewCell() }
        cell.set(content: dataSource[indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var content = dataSource[indexPath.row]
        content.expandle = !content.expandle
        dataSource[indexPath.row] = content
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

