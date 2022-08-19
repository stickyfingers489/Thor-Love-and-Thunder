//
//  TopicsTableViewCell.swift
//  Thor Love and Thunder
//
//  Created by stickerfinger489 on 10/08/2022.
//

import UIKit

class TopicsTableViewCell: UITableViewCell {
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var topicIcon: UIImageView!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Accessibility
        topicLabel.adjustsFontForContentSizeCategory = true
        topicLabel.font = UIFont.preferredFont(for: .body, weight: .semibold)
        topicLabel.maximumContentSizeCategory = .extraExtraLarge
        

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     
    }

}
