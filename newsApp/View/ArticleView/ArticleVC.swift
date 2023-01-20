//
//  ArticleVC.swift
//  newsApp
//
//  Created by Hastomi Riduan Munthe on 18/01/23.
//

import UIKit

class ArticleVC: UIViewController, UISearchResultsUpdating {
    
    var source = ""
    var articles = [Article]()
    var viewModel = ArticleViewModel()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var articleTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        articleTableView.register(UINib(nibName: "ArticleTVC", bundle: nil), forCellReuseIdentifier: "ArticleTVC")
        articleTableView.dataSource = self
        articleTableView.delegate = self
        
        viewModel.loadArticle(source: source) { result in
            self.articles = result
            self.articleTableView.reloadData()
        }

        
        title = "Article News"
        
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController

    }

    func setSource(source: String) {
        title = source
        self.source = source
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        
        viewModel.searchArticle(source: source, keyword: text) { result in
            self.articles = result
            self.articleTableView.reloadData()
        }
    }
    
    func goToWebViewController(articleUrl: String) {
        let destination = WebViewController()
        destination.setArticleUrl(articleUrl: articleUrl)
        navigationController?.pushViewController(destination, animated: true)
    }
    
}

extension ArticleVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTVC", for: indexPath) as! ArticleTVC
        
        let article = articles[indexPath.row]
        cell.configure(title: article.title, publishedAt: article.publishedAt, urlToImage: article.urlToImage)
        
        return cell
    }
}

extension ArticleVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        goToWebViewController(articleUrl: article.url ?? "")
    }

}
