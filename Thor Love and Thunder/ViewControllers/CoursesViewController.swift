//
//  CoursesViewController.swift
//  Thor Love and Thunder
//
//  Created by stickerfinger489 on 03/08/2022.
//

import UIKit
import Combine


class CoursesViewController: UIViewController {
    
   
    var course: Course?

   
    @IBOutlet var bannerImage: UIImageView!
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
//    @IBOutlet var iconImageView: CustomImageView!
    
    @IBOutlet weak var sectionsTableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    private var tokens: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectionsTableView.delegate = self
        sectionsTableView.dataSource = self
        sectionsTableView.publisher(for: \.contentSize)
            .sink { newContentSize  in
                self.tableViewHeight.constant = newContentSize.height
                
            }
            .store(in: &tokens)
     
        
       // set date for preview card
     //   self.iconImageView.image = course?.courseIcon
        self.bannerImage.image = course?.courseBanner
        self.backgroundImage.image = course?.courseBackground
        self.titleLabel.text = course? .courseTitle
        self.descriptionLabel.text = course? .courseSubtitle
        self.authorLabel.text = "Taught by \(course?.courseAuthor?.formatted(.list(type: .and, width: .standard)) ?? "Design+Code")"
    }
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension CoursesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.course?.sections?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell", for: indexPath) as! SectionTableViewCell
        if let selectedCourse = course {
            let selectedSection = selectedCourse.sections![indexPath.row]

            cell.titleLabel.text = selectedSection.sectionTitle
            cell.courseLogo.image = selectedSection.sectionIcon
            cell.descriptionLabel.text = selectedSection.sectionDescription
            cell.subtitleLabel.text = selectedSection.sectionSubtitle
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
