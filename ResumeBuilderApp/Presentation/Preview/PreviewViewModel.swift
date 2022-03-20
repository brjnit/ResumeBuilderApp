//
//  PreviewViewModel.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 16/03/22.
//

import Foundation


class PreviewViewModel {
    let resume: Resume
    var profileImage: String? {
        resume.profileImage
    }
    var name: String? {
        resume.personalDetails?.name
    }
    var address: String? {
        resume.personalDetails?.address
    }
    var email: String? {
        resume.personalDetails?.email
    }
    var contact: String? {
        resume.personalDetails?.phone
    }
    var objective: String? {
        resume.objective
    }
    var totalExperience: String? {
        "I have total \(resume.totalExperience ?? "") years of experience."
    }
    
    init(resume: Resume) {
        self.resume = resume
    }
    
    var skills: [String] {
        resume.skills.map { $0.name ?? ""}.filter{!$0.isEmpty}
    }
    
    var educations: [Education] {
        resume.education
    }
    
    var projects: [Project] {
        resume.projects
    }
    var workSummaries: [WorkSummary] {
        resume.workSummaries
    }
}
