//
//  ProfileViewModel.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 16/03/22.
//

import Foundation

class ProfileViewModel {
    private let repository: ResumeRepository
    private var resume: Resume?
    var profileImage: String?
    private var objective: String?
    private var totalExperience: String?
    private var personalDetails: PersonalDetails?
    private var education: [Education] = []
    private var skills: [Skills] = []
    private var projects: [Project] = []
    private var workSummary: [WorkSummary] = []
    
    private var profileFields: [String] = ["Personal Details", "Objective", "Experience", "Education", "Skills", "Projects","Work summary"]
    var noOfSections: Int {
        return profileFields.count
    }
    
    var didUpdate: (()-> Void)?
    var didFail: ((String?)-> Void)?
    let closures: ProfileClosures
    init(resume: Resume?, repository: ResumeRepository, closures: ProfileClosures) {
        self.repository = repository
        self.closures = closures
        self.resume = resume
        loadExitingResume()
    }
    
    func loadExitingResume() {
        self.profileImage = resume?.profileImage
        self.personalDetails = resume?.personalDetails
        self.objective = resume?.objective
        self.totalExperience = resume?.totalExperience
        self.skills = resume?.skills ?? [Skills(id: 1, name: nil)]
        self.education = resume?.education ?? [Education(id: 1, instituteName: nil, course: nil, passingYear: nil, cgpa: nil)]
        self.projects = resume?.projects ?? [Project(id: 1)]
        self.workSummary = resume?.workSummaries ?? [WorkSummary(id: 1, companyName: nil, duration: nil)]
    }
    
    func navigateToPreview() {
        closures.navigateToPreview(makeResume())
    }
    
    func upload(image: String?) {
        profileImage = image
    }
    
    func createNewResume() {
        repository.save(makeResume()) { [weak self]  result in
            switch result {
            case .success: self?.didUpdate?()
            case .failure(let error): self?.didFail?(error.localizedDescription)
            }
        }
    }
    
    func validateFields() -> Bool {
        if let email = personalDetails?.email, !email.isValidEmail {
            didFail?("Invalid email Id")
            return false
        }
        if let phone = personalDetails?.phone, !phone.isValidPhoneNumber {
            didFail?("Invalid phone number")
            return false
        }
        return true
    }
    
    func makeResume()->Resume {
        return Resume(id: UUID(),
                      profileImage: profileImage,
                      personalDetails: personalDetails,
                      objective: objective,
                      totalExperience: totalExperience,
                      workSummaries: workSummary,
                      skills: skills,
                      education: education,
                      projects: projects,
                      createdAt: Date())
    }
    
    func noOfRows(for section: Int) -> Int {
        let indexValue = profileFields[section]
        switch indexValue {
        case LayoutType.personalDetails.rawValue, LayoutType.objective.rawValue, LayoutType.experience.rawValue:
            return 1
        case LayoutType.education.rawValue:
            return (education.count)
        case LayoutType.skills.rawValue:
            return (skills.count)
        case LayoutType.projects.rawValue:
            return (projects.count)
        case LayoutType.workSummary.rawValue:
            return (workSummary.count)
        default: return 0
        }
    }
    
    func cellViewModel(for indexPath: IndexPath) -> ComponentCellViewModelType? {
        let indexValue = profileFields[indexPath.section]
        switch indexValue {
        case LayoutType.personalDetails.rawValue:
            return PersonalDetailsCellViewModel(personalDetails: personalDetails)
        case LayoutType.education.rawValue:
            return EducationCellViewModel(instituteName: education[indexPath.row].instituteName,
                                          course: education[indexPath.row].course,
                                          passingYear: education[indexPath.row].passingYear,
                                          cgpa: education[indexPath.row].cgpa)
        case LayoutType.skills.rawValue:
            return SkillsCellViewModel(skill: skills[indexPath.row].name)
        case LayoutType.objective.rawValue:
            return ObjectiveCellViewModel(objective: objective)
        case LayoutType.projects.rawValue:
            let project = projects[indexPath.row]
            return ProjectsCellViewModel(projectName: project.projectName,
                                         teamSize: project.teamSize,
                                         role: project.role,
                                         technologyUsed: project.technologyUsed,
                                         summury: project.summury)
        case LayoutType.experience.rawValue: return ExperienceCellViewModel(totalExperience: totalExperience)
        case LayoutType.workSummary.rawValue: return WorkSummaryCellViewModel(companyName: workSummary[indexPath.row].companyName, duration: workSummary[indexPath.row].duration)
        default: return nil
        }
    }
    
    func headerTitle(for section: Int)  -> String {
        return profileFields[section]
    }
    
    func isAddNewRequired(for section: Int)  -> Bool {
        let indexValue = profileFields[section]
        switch indexValue {
        case LayoutType.education.rawValue,LayoutType.skills.rawValue, LayoutType.projects.rawValue,LayoutType.workSummary.rawValue: return true
        default: return false
        }
    }
    
    func addNewField(for section: Int) {
        let indexValue = profileFields[section]
        switch indexValue {
        case LayoutType.education.rawValue:
            let lastIndex = education.count
            education.append(Education(id: lastIndex+1, instituteName: nil, course: nil, passingYear: nil, cgpa: nil))
        case LayoutType.skills.rawValue:
            let lastIndex = skills.count
            skills.append(Skills(id: lastIndex+1, name: nil))
        case LayoutType.workSummary.rawValue:
            let lastIndex = workSummary.count
            workSummary.append(WorkSummary(id: lastIndex+1, companyName: nil, duration: nil))
        case LayoutType.projects.rawValue:
            let lastIndex = projects.count
            projects.append(Project(id: lastIndex+1))
        default: break
        }
        didUpdate?()
    }
    
    func getLayoutType(for index: Int) -> LayoutType? {
        let indexValue = profileFields[index]
        switch indexValue {
        case LayoutType.personalDetails.rawValue:
            return .personalDetails
        case LayoutType.education.rawValue:
            return .education
        case LayoutType.skills.rawValue:
            return .skills
        case LayoutType.objective.rawValue:
            return .objective
        case LayoutType.experience.rawValue:
            return .experience
        case LayoutType.workSummary.rawValue:
            return .workSummary
        case LayoutType.projects.rawValue:
            return .projects
        default: return nil
        }
    }
    
    func update(personalDetails: PersonalDetails) {
        self.personalDetails = personalDetails
    }
    
    func updateSkills(with skillName: String?, at index: Int) {
        let skillAtIndex = skills[index]
        skills[index] = Skills(id: skillAtIndex.id, name: skillName)
    }
    
    func updateObjective(with text: String?) {
        objective = text
    }
    
    
    func updateExperience(with text: String?) {
       totalExperience = text
    }
    
    func updateEducation(with text: String?, and field: EducationTextField, at index: Int) {
        switch field {
        case .name:
            education[index].instituteName = text
        case .course:
            education[index].course = text
        case .passingYear:
            education[index].passingYear = text
        case .cgpa:
            education[index].cgpa = text
        }
    }
    
    func updateProjects(with text: String?, and field: ProjectTextField, at index: Int) {
        switch field {
        case .projectName:
            projects[index].projectName = text
        case .teamSize:
            projects[index].teamSize = text
        case .role:
            projects[index].role = text
        case .technology:
            projects[index].technologyUsed = text
        case .summary:
            projects[index].summury = text
        }
    }
    
    func updateWorkSummary(with text: String?, and field: WorkSummaryTextField, at index: Int) {
        switch field {
        case .companyName:
            workSummary[index].companyName = text
        case .duration:
            workSummary[index].duration = text
        }
    }
    
}

struct ProfileClosures {
    var navigateToPreview: (Resume) -> Void
    
}

protocol ComponentCellViewModelType { }
