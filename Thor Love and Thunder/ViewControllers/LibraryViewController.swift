//
//  LibraryViewController.swift
//  Thor Love and Thunder
//
//  Created by stickerfinger489 on 24/08/2022.
//

import UIKit
import Combine
import SwiftUI


class LibraryViewController: UIViewController {
    @IBOutlet weak var topicTableView: UITableView!
    @IBOutlet weak var sectionsCollectionsView: UICollectionView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var CertificatesLabel: UILabel!
    
    
    private var tokens: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Collection View
                self.sectionsCollectionsView.delegate = self
                self.sectionsCollectionsView.dataSource = self
                self.sectionsCollectionsView.layer.masksToBounds = false

                // Table View
                self.topicTableView.delegate = self
                self.topicTableView.dataSource = self
                self.topicTableView.layer.masksToBounds = true

                // Subscribe to table view changes
                topicTableView
                    .publisher(for: \.contentSize)
                    .sink { contentSize in
                        self.tableViewHeight.constant = contentSize.height + 10
                    }
                    .store(in: &tokens)

                // Accessibility
                titleLabel.maximumContentSizeCategory = .accessibilityExtraLarge
                titleLabel.font = UIFont.preferredFont(for: .title2, weight: .bold)
                titleLabel.adjustsFontForContentSizeCategory = true

                CertificatesLabel.maximumContentSizeCategory = .accessibilityMedium
                CertificatesLabel.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
                CertificatesLabel.adjustsFontForContentSizeCategory = true
            }
    
    @IBSegueAction func createCertificatesView(_ coder: NSCoder) -> UIViewController? {
        let v = UIHostingController(coder: coder, rootView: CertificateView())!
        v.view.backgroundColor = .clear
        return v
    }
}

        extension LibraryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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

        extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return topics.count
            }

            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath) as! TopicsTableViewCell
                let setting = librarySettings[indexPath.row]

                cell.topicLabel.text = setting.topicName
                cell.topicIcon.image = UIImage(systemName: setting.topicSymbol)

                return cell
            }

            func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
