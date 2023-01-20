//
//  SourceVC.swift
//  newsApp
//
//  Created by Hastomi Riduan Munthe on 18/01/23.
//

import UIKit

class SourceVC: UIViewController, UISearchResultsUpdating {
    @IBOutlet weak var sourceTableView: UITableView!
    @IBOutlet weak var erorLabel: UILabel!
    
    var category = ""
    var sources = [SourceResponse]()
    var viewModel = SourceViewModel()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        erorLabel.isHidden = true
        
        sourceTableView.register(UINib(nibName: "SourceTVC", bundle: nil), forCellReuseIdentifier: "SourceTVC")
        sourceTableView.dataSource = self
        sourceTableView.delegate = self
        
        viewModel.loadSources(category: category) { result in
            switch result {
            case let .success(data):
                self.erorLabel.isHidden = true
                self.sources = data
            case .failure:
                self.erorLabel.isHidden = false
            }
            self.sourceTableView.reloadData()
        }
        
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        
        viewModel.searchSource(keyword: text) { result in
            self.sources = result
            self.sourceTableView.reloadData()
        }
    }
    
    func goToArticleViewController(source: String) {
        let destination = ArticleVC()
        destination.setSource(source: source)
        navigationController?.pushViewController(destination, animated: true)
    }
    
    
    func setCategory(category: String) {
        title = category
        self.category = category
    }
    
    
}

extension SourceVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SourceTVC", for: indexPath) as! SourceTVC
        let source = sources[indexPath.row]
        cell.configure(title: source.name, description: source.description)
        
        return cell
    }
}

extension SourceVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let source = sources[indexPath.row]
        goToArticleViewController(source: source.id ?? "")
    }
}
