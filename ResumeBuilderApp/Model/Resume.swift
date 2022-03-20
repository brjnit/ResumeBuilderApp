//
//  Resume.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 10/03/22.
//

import Foundation


public struct Resume: Codable {
    let id: UUID
    var profileImage: String?
    var personalDetails: PersonalDetails?
    var objective: String?
    var totalExperience: String?
    var workSummaries: [WorkSummary]
    var skills: [Skills]
    var education: [Education]
    var projects: [Project]
    let createdAt: Date
}

public struct PersonalDetails: Codable {
    var name: String?
    var address: String?
    var email: String?
    var phone: String?
}

public struct WorkSummary: Codable {
    let id: Int
    var companyName: String?
    var duration: String?
}

public struct Education: Codable {
    let id: Int
    var instituteName: String?
    var course: String?
    var passingYear: String?
    var cgpa: String?
}

public struct Skills: Codable {
    let id: Int
    let name: String?
}

public struct Project: Codable {
    let id: Int
    var projectName: String?
    var teamSize: String?
    var role: String?
    var technologyUsed: String?
    var summury: String?
}



