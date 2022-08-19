//
//  FeaturedViewController.swift
//  Thor Love and Thunder
//
//  Created by stickerfinger489 on 14/07/2022.
//

import UIKit
import Combine



class FeaturedViewController: UIViewController {

    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var CardView: UIView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var handbooksCollectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var CoursesTableView: UITableView!
    @IBOutlet weak var FeaturedTitleLabel: UILabel!
    
    @IBOutlet weak var FeaturedSubtitleLabel: UILabel!
    
    @IBOutlet weak var FeaturedDescLabel: UILabel!
    
    @IBOutlet weak var handbookslabel: UILabel!
    
    @IBOutlet weak var coursesLabel: UILabel!
    
    private var tokens: Set<AnyCancellable> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handbooksCollectionView.delegate = self
        handbooksCollectionView.dataSource = self
        handbooksCollectionView.layer.masksToBounds = false

        CoursesTableView.delegate = self
        CoursesTableView.dataSource = self
        CoursesTableView.layer.masksToBounds = false
        
        CoursesTableView.publisher(for: \.contentSize)
            .sink { newContentSize  in
                self.tableViewHeight.constant = newContentSize.height
                
            }
            .store(in: &tokens)
        
        scrollView.delegate = self
        
        // Accessibility
        FeaturedTitleLabel.adjustsFontForContentSizeCategory = true
        FeaturedTitleLabel.font = UIFont.preferredFont(for: .title1, weight: .bold)
        FeaturedTitleLabel.maximumContentSizeCategory = .accessibilityExtraLarge
        
        FeaturedSubtitleLabel.adjustsFontForContentSizeCategory = true
        FeaturedSubtitleLabel.font = UIFont.preferredFont(for: .footnote, weight: .bold)
        FeaturedSubtitleLabel.maximumContentSizeCategory = .accessibilityMedium
        
        FeaturedDescLabel.adjustsFontForContentSizeCategory = true
        FeaturedDescLabel.font = UIFont.preferredFont(for: .footnote, weight: .regular)
        FeaturedDescLabel.maximumContentSizeCategory = .accessibilityMedium
        
        handbookslabel.adjustsFontForContentSizeCategory = true
        handbookslabel.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
        handbookslabel.maximumContentSizeCategory = .accessibilityMedium
        
        coursesLabel.adjustsFontForContentSizeCategory = true
        coursesLabel.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
        coursesLabel.maximumContentSizeCategory = .accessibilityMedium
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsVC = segue.destination as? CoursesViewController, let course = sender as? Course {
            detailsVC.course = course
        }
    }
}

extension FeaturedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return handbooks.count
 }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCell", for: indexPath) as! HandbookCollectionViewCell
        let handbook = handbooks[indexPath.item]
        
        cell.Titlelabel.text = handbook.courseTitle
        cell.Subtitlelabel.text = handbook.courseSubtitle
        cell.Descriptionlabel.text = handbook.courseDescription
        cell.gradient.colors = handbook.courseGradient
        cell.logo.image = handbook.courseIcon
        cell.banner.image = handbook.courseBanner
        
        return cell
    }
}

extension FeaturedViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        courses.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoursesTableCell", for: indexPath) as!
        CoursesTableViewCell
        let course = courses[indexPath.section]
        
        cell.titleLabel.text = course.courseTitle
        cell.subtitleLabel.text = course.courseSubtitle
        cell.descriptionLabel.text = course.courseDescription
        cell.courseBackground.image = course.courseBackground
        cell.courseBanner.image = course.courseBanner
        cell.courseLogo.image = course.courseIcon
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }
        return 20
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCourse = courses[indexPath.section]
        performSegue(withIdentifier: "presentCourse", sender: selectedCourse)
    }
}
 
extension FeaturedViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentHeight = scrollView.contentSize.height
        let lastScrollYPos = scrollView.contentOffset.y

        let percentage = lastScrollYPos / contentHeight
        if percentage <= 0.15 {
            self.title = "Featured"
        } else if percentage <= 0.33 {
            self.title = "Handbooks"
        } else {
            self.title = "Courses"
        }
    }
}
