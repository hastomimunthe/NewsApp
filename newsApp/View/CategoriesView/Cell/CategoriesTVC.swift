//
//  CategoriesVTC.swift
//  newsApp
//
//  Created by Hastomi Riduan Munthe on 18/01/23.
//

import UIKit

class CategoriesTVC: UITableViewCell {

    
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func configure(text: String) {
        categoryLabel.text = text
    
    }
}
