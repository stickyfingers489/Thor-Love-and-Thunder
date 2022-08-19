//
//  ExploreViewController.swift
//  Thor Love and Thunder
//
//  Created by stickerfinger489 on 09/08/2022.
//

import UIKit
import Combine

class ExploreViewController: UIViewController {

    @IBOutlet weak var topicTableView: UITableView!
    @IBOutlet weak var sectionsCollectionsView: UICollectionView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    private var tokens: Set<AnyCancellable> = []
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var topicsLabel: UILabel!
    @IBOutlet weak var popularLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sectionsCollectionsView.delegate = self
        sectionsCollectionsView.dataSource = self
        sectionsCollectionsView.layer.masksToBounds = false
        
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        popularCollectionView.layer.masksToBounds = false
        
        
        topicTableView.delegate = self
        topicTableView.dataSource = self
        topicTableView.layer.masksToBounds = false
        topicTableView.publisher(for: \.contentSize)
            .sink { newContentSize  in
                self.tableViewHeight.constant = newContentSize.height
                
            }
            .store(in: &tokens)
        
        // Accessibility
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.font = UIFont.preferredFont(for: .title2, weight: .bold)
        titleLabel.maximumContentSizeCategory = .accessibilityExtraLarge
        
        
        topicsLabel.adjustsFontForContentSizeCategory = true
        topicsLabel.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
        topicsLabel.maximumContentSizeCategory = .accessibilityMedium
        
        popularLabel.adjustsFontForContentSizeCategory = true
        popularLabel.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
        popularLabel.maximumContentSizeCategory = .accessibilityMedium
            
    }
    

}

extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView ==  sectionsCollectionsView {
            return sections.count
        } else {
            return handbooks.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == sectionsCollectionsView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionCell", for: indexPath) as! SectionsCollectionViewCell
            let section = sections[indexPath.item]

            cell.Titlelabel.text = section.sectionTitle
            cell.Subtitlelabel.text = section.sectionSubtitle
            cell.logo.image = section.sectionIcon
            cell.banner.image = section.sectionBanner

            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCell", for: indexPath) as! HandbookCollectionViewCell
            let handbook = handbooks[indexPath.item]
            
            cell.Titlelabel.text = handbook.courseTitle
            cell.Subtitlelabel.text = handbook.courseSubtitle
            cell.Descriptionlabel.text = handbook.courseDescription
            cell.gradient.colors = handbook.courseGradient
            cell.logo.image = handbook.courseIcon
            cell.banner.image = handbook.courseBanner
            
            return cell        }
        
    }
}

extension ExploreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath) as! TopicsTableViewCell
        let topic = topics[indexPath.row]

        cell.topicLabel.text = topic.topicName
        cell.topicIcon.image = UIImage(systemName: topic.topicSymbol)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

