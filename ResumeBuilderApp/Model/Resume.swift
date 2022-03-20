//
//  Resume.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 10/03/22.
//

import Foundation


public struct Resume {
   // let id: Int
    var profileImage: String?
    var personalDetails: PersonalDetails?
    var objective: String?
    var totalExperience: String?
    var workSummaries: [WorkSummary]
    var skills: [Skills]
    var education: [Education]
    var projects: [Project]
    let createdDate: Date
    
    init(profileImage: String? = nil, personalDetails: PersonalDetails? = nil, objective: String? = nil, totalExperience: String? = nil, workSummaries: [WorkSummary] = [], skills: [Skills] = [], education: [Education] = [], projects: [Project] = []) {
       // self.id = id
        self.profileImage = profileImage
        self.personalDetails = personalDetails
        self.objective = objective
        self.totalExperience = totalExperience
        self.workSummaries = workSummaries
        self.skills = skills
        self.education = education
        self.projects = projects
        self.createdDate = Date()
    }
    
}

public struct PersonalDetails {
    var name: String?
    var address: String?
    var email: String?
    var phone: String?
    
    init(name: String? = nil, address: String? = nil, email: String? = nil, phone: String? = nil) {
        self.name = name
        self.address = address
        self.email = email
        self.phone = phone
    }
}

public struct WorkSummary {
    let id: Int
    var companyName: String?
    var duration: String?
}

public struct Education {
    let id: Int
    var instituteName: String?
    var course: String?
    var passingYear: String?
    var cgpa: String?
}

public struct Skills {
    let id: Int
    let name: String?
}

public struct Project {
    let id: Int
    var projectName: String?
    var teamSize: String?
    var role: String?
    var technologyUsed: String?
    var summury: String?
    init(id: Int,
    projectName: String? = nil,
     teamSize: String? = nil,
     role: String? = nil,
     technologyUsed: String? = nil,
     summury: String? = nil) {
        self.id = id
        self.projectName = projectName
        self.teamSize = teamSize
        self.role = role
        self.technologyUsed = technologyUsed
        self.summury = summury
    }
}



