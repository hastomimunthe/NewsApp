//
//  CategoriesVC.swift
//  newsApp
//
//  Created by Hastomi Riduan Munthe on 18/01/23.
//

import UIKit

class CategoriesVC: UIViewController {
    
    @IBOutlet weak var categoriesTableView: UITableView!
    
    var viewModel = MainViewModel()
    var categories  = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "News Categories"
        
        categoriesTableView.register(UINib(nibName: "CategoriesTVC", bundle: nil), forCellReuseIdentifier: "CategoriesTVC")
        categoriesTableView.dataSource = self
        categoriesTableView.delegate = self
        
        viewModel.loadCategories { result in
            self.categories = result
            self.categoriesTableView.reloadData()
        }
        
    }
    
    func goToSourceViewController(category: String) {
        let destination = SourceVC()
        destination.setCategory(category: category)
        navigationController?.pushViewController(destination, animated: true)
    }
    
}

extension CategoriesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesTVC", for: indexPath) as! CategoriesTVC

        let category = categories[indexPath.row]
        cell.configure(text: category)

        return cell
    }
}

extension CategoriesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        goToSourceViewController(category: category)
    }
}
