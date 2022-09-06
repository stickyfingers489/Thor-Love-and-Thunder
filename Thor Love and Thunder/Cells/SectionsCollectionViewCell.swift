//
//  SectionsCollectionViewCell.swift
//  Thor Love and Thunder
//
//  Created by stickerfinger489 on 09/08/2022.
//

import UIKit

class SectionsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var banner: UIImageView!
    @IBOutlet weak var logo: CustomImageView!
    @IBOutlet weak var Subtitlelabel: UILabel!
    @IBOutlet weak var Titlelabel: UILabel!
    
    
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        super.layoutIfNeeded()
    }
    override public func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(named: "Shadow")!.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 10
        layer.masksToBounds = false
        layer.cornerRadius = 30
        layer.cornerCurve = .continuous
        
        // Accessibility
        Titlelabel.adjustsFontForContentSizeCategory = true
        Titlelabel.font = UIFont.preferredFont(for: .body, weight: .semibold)
        Titlelabel.maximumContentSizeCategory = .extraExtraLarge
        
        Subtitlelabel.adjustsFontForContentSizeCategory = true
        Subtitlelabel.font = UIFont.preferredFont(for: .caption1, weight: .regular)
        Subtitlelabel.maximumContentSizeCategory = .extraLarge
        
  
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
