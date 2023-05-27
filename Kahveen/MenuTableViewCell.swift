//
//  MenuTableViewCell.swift
//  Kahveen
//
//  Created by Burak Altunoluk on 27/05/2023.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
