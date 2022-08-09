//
//  ExploreViewController.swift
//  Thor Love and Thunder
//
//  Created by stickerfinger489 on 09/08/2022.
//

import UIKit

class ExploreViewController: UIViewController {

    @IBOutlet weak var sectionsCollectionsView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        sectionsCollectionsView.delegate = self
        sectionsCollectionsView.dataSource = self
        sectionsCollectionsView.layer.masksToBounds = false
    }
    

}

extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionCell", for: indexPath) as! SectionsCollectionViewCell
        let section = sections[indexPath.item]

        cell.Titlelabel.text = section.sectionTitle
        cell.Subtitlelabel.text = section.sectionSubtitle
        cell.logo.image = section.sectionIcon
        cell.banner.image = section.sectionBanner

        return cell
    }
}

