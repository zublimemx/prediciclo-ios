//
//  Mas.swift
//  PrediCiclo
//
//  Created by Daniel Barcenas on 1/20/20.
//  Copyright © 2020 Zublime. All rights reserved.
//

import UIKit

class Mas: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    
    
    @IBOutlet weak var menuTableView: UITableView!
    
    // MARK: Variables
    var bundle: Bundle?
    var menu = [CellModel]()
    
    // MARK: Controls
    
    // MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        menuTableView.separatorStyle = .none
        menuTableView.rowHeight = 70
        
        menuTableView.tableFooterView = UIView ()
        bundle = Bundle(for: type(of: self))
        
        if let url = bundle?.url(forResource: "MenuData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                menu = try decoder.decode([CellModel].self, from: data)
            } catch {
                print("No se encontro el arreglo")
            }
        }
    }
    
    // MARK: Actions

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
        
    }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MenuTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath) as? MenuTableViewCell
        for item in menu {
            if item.id == indexPath.row {
                cell.itemImage!.image = UIImage(named: item.image)
                cell.itemLabel!.text = item.label
                return cell
            }
        }
       return cell
      }
    
    
    
    
    
    
}
