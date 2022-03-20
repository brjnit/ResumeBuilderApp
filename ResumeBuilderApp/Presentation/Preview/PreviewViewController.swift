//
//  SkillsViewController.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 09/03/22.
//

import UIKit

class PreviewViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var ObjectiveLabel: UILabel!
    @IBOutlet weak var educationStackView: UIStackView!
    @IBOutlet weak var totalExpereinceLabel: UILabel!
    @IBOutlet weak var workSummarySatckView: UIStackView!
    
    @IBOutlet weak var skillsStackView: UIStackView!
    
    @IBOutlet weak var projectsStackView: UIStackView!
    
    var viewModel:PreviewViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureSkills()
        configureEducation()
        configureWorkSummary()
        configureProjects()
    }
    
    private func configureView() {
        profileImageView.image = viewModel.profileImage?.decodeBase64StringToImage()
        profileImageView.makeRounded()
        nameLabel.text = viewModel.name
        addressLabel.text = viewModel.address
        emailLabel.text = viewModel.email
        contactLabel.text = viewModel.contact
        ObjectiveLabel.text = viewModel.objective
        totalExpereinceLabel.text = viewModel.totalExperience
    }
    
    private func configureEducation() {
        for index in 0..<viewModel.educations.count {
            let educationView = EductionView()
            educationView.configure(with: viewModel.educations[index])
            educationStackView.addArrangedSubview(educationView)
        }
    }
    
    private func configureSkills() {
        for index in 0..<viewModel.skills.count {
            let skillLabel = UILabel()
            skillLabel.font = UIFont(name: "System", size: 12)
            skillLabel.text = viewModel.skills[index]
            skillsStackView.addArrangedSubview(skillLabel)
        }
    }
    
    private func configureWorkSummary() {
        for index in 0..<viewModel.workSummaries.count {
            let workSummaryView = WorkSummaryView()
            workSummaryView.configure(with: viewModel.workSummaries[index])
            workSummarySatckView.addArrangedSubview(workSummaryView)
        }
    }
    
    private func configureProjects() {
        for index in 0..<viewModel.projects.count {
            let projectView = ProjectView()
            projectView.configure(with: viewModel.projects[index])
            projectsStackView.addArrangedSubview(projectView)
        }
    }
}
