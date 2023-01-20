//
//  WebViewController.swift
//  newsApp
//
//  Created by Hastomi Riduan Munthe on 18/01/23.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var articleUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWebView()
    }
    
    func loadWebView() {
        let url = URL(string: self.articleUrl)!
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
        
    }
    
    func setArticleUrl(articleUrl: String){
        self.articleUrl = articleUrl
    }
}

