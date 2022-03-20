//
//  SkillTableViewCell.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 09/03/22.
//

import UIKit

class SkillTableViewCell: UITableViewCell {

    @IBOutlet weak var skillsView: LabelTextFieldView!
    static let reuseIdendifier: String = "SkillTableViewCell"
    
    var onTextchange: ((String?)->Void)?
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(with viewModel: SkillsCellViewModel) {
        skillsView.titleLabel.text = "Skills"
        skillsView.textField.placeholder = "Add skills"
        skillsView.textField.delegate = self
        skillsView.textField.text = viewModel.skill
    }
    
}

extension SkillTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        onTextchange?(textField.text)
    }
}
