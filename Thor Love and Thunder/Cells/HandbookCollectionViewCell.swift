//
//  HandbookCollectionViewCell.swift
//  Thor Love and Thunder
//
//  Created by stickerfinger489 on 19/07/2022.
//

import UIKit

class HandbookCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var overlay: UIView!
    
    @IBOutlet weak var banner: UIImageView!
    @IBOutlet weak var logo: CustomImageView!
    @IBOutlet weak var Progressbar: UIProgressView!
    @IBOutlet weak var Subtitlelabel: UILabel!
    @IBOutlet weak var Descriptionlabel: UILabel!
    @IBOutlet weak var Titlelabel: UILabel!
    
    let gradient = CAGradientLayer()
    
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
        
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.frame = overlay.frame
        gradient.cornerCurve = .continuous
        gradient.cornerRadius = 30
        
        overlay.layer.insertSublayer(gradient, at: 0)
        overlay.layer.cornerRadius = 30
        overlay.layer.cornerCurve = .continuous
        
        // Accessibility
        Titlelabel.adjustsFontForContentSizeCategory = true
        Titlelabel.font = UIFont.preferredFont(for: .headline, weight: .semibold)
        Titlelabel.maximumContentSizeCategory = .extraExtraLarge
        
        Subtitlelabel.adjustsFontForContentSizeCategory = true
        Subtitlelabel.font = UIFont.preferredFont(for: .caption2, weight: .semibold)
        Subtitlelabel.maximumContentSizeCategory = .extraExtraLarge
        
        Descriptionlabel.adjustsFontForContentSizeCategory = true
        Descriptionlabel.font = UIFont.preferredFont(for: .caption2, weight: .semibold)
        Descriptionlabel.maximumContentSizeCategory = .extraExtraLarge
        
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
