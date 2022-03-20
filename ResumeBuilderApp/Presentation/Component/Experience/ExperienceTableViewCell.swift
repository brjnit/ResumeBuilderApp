//
//  ExperienceTableViewCell.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 12/03/22.
//

import UIKit

class ExperienceTableViewCell: UITableViewCell {

    @IBOutlet weak var experienceView: LabelTextFieldView!
    static let reuseIdendifier: String = "ExperienceTableViewCell"
    var onTextchange: ((String?)->Void)?
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(with viewModel: ExperienceCellViewModel) {
        experienceView.titleLabel.text = "Total Experience"
        experienceView.textField.placeholder = "Enter experience in year"
        experienceView.textField.delegate = self
        experienceView.textField.text = viewModel.totalExperience
        experienceView.textField.keyboardType = .numberPad
    }
    
}

extension ExperienceTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        onTextchange?(textField.text)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 3
        return range.location < maxLength - 1
    }
}
