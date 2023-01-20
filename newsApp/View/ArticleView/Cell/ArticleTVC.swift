//
//  ArticleTVC.swift
//  newsApp
//
//  Created by Hastomi Riduan Munthe on 18/01/23.
//

import UIKit
import Kingfisher

class ArticleTVC: UITableViewCell {
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var labelPublished: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        newsImage.contentMode = .scaleAspectFill
        newsImage.layer.cornerRadius = 8
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configure(title: String?, publishedAt: String?, urlToImage: String?){
        labelPublished.text = publishedAt
        labelTitle.text = title
        if let url = URL(string: urlToImage ?? "") {
            newsImage.kf.setImage(with: url)
        }
        
    }
}
