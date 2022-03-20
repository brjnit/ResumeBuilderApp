//
//  ProfileTableViewCell.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 09/03/22.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var updatedDateLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(model: ProfileCellModel) {
        profileImageView.image = model.profileImage?.decodeBase64StringToImage()
        profileImageView.makeRounded()
        nameLabel.text = model.name
        emailLabel.text = model.email
        contactLabel.text = model.contact
        updatedDateLabel.text = model.updatedDate
        
    }
}

struct ProfileCellModel {
    let profileImage: String?
    let name: String?
    let email: String?
    let contact: String?
    let updatedDate: String?
}
