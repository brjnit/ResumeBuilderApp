//
//  ExperinceTableViewCell.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 10/03/22.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {
    @IBOutlet weak var projectNameView: LabelTextFieldView!
    @IBOutlet weak var teamSizeView: LabelTextFieldView!
    @IBOutlet weak var roleView: LabelTextFieldView!
    @IBOutlet weak var technologyUsedView: LabelTextFieldView!
    @IBOutlet weak var summuryView: LabelWithTextView!
    static let reuseIdendifier: String = "ProjectTableViewCell"
    
    var onTextchange: ((String?, ProjectTextField)->Void)?
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(with viewModel: ProjectsCellViewModel) {
        projectNameView.titleLabel.text = "Project Name"
        teamSizeView.titleLabel.text = "Team Size"
        roleView.titleLabel.text = "Role"
        technologyUsedView.titleLabel.text = "Technology used"
        summuryView.titleLabel.text = "Summary"
        
        projectNameView.textField.placeholder = "Enter project name"
        teamSizeView.textField.placeholder = "Enter team size"
        roleView.textField.placeholder = "Enter role"
        technologyUsedView.textField.placeholder = "Enter technology used"
        
        projectNameView.textField.delegate = self
        teamSizeView.textField.delegate = self
        roleView.textField.delegate = self
        technologyUsedView.textField.delegate = self
        summuryView.textView.delegate = self
        projectNameView.textField.tag = 0
        teamSizeView.textField.tag = 1
        roleView.textField.tag = 2
        technologyUsedView.textField.tag = 3
        summuryView.textView.tag = 4
        teamSizeView.textField.keyboardType = .numberPad
        
        projectNameView.textField.text = viewModel.projectName
        teamSizeView.textField.text = viewModel.teamSize
        roleView.textField.text = viewModel.role
        technologyUsedView.textField.text = viewModel.technologyUsed
        summuryView.textView.text = viewModel.summury
    }
    
}

extension ProjectTableViewCell: UITextViewDelegate, UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.tag == 0 {
            onTextchange?(textView.text, .projectName)
        } else  if textView.tag == 1 {
            onTextchange?(textView.text, .teamSize)
        } else  if textView.tag == 2 {
            onTextchange?(textView.text, .role)
        } else  if textView.tag == 3 {
            onTextchange?(textView.text, .technology)
        }else if textView.tag == 4 {
            onTextchange?(textView.text, .summary)
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            onTextchange?(textField.text, .projectName)
        } else  if textField.tag == 1 {
            onTextchange?(textField.text, .teamSize)
        } else  if textField.tag == 2 {
            onTextchange?(textField.text, .role)
        } else  if textField.tag == 3 {
            onTextchange?(textField.text, .technology)
        }else if textField.tag == 4 {
            onTextchange?(textField.text, .summary)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 1 {
            let maxLength = 3
            return range.location < maxLength - 1
        }
        return true
    }
}

enum ProjectTextField {
    case projectName
    case teamSize
    case role
    case technology
    case summary
}

