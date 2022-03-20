//
//  EducationTableViewCell.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 10/03/22.
//

import UIKit

class EducationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var instituteNameView: LabelTextFieldView!
    @IBOutlet weak var courseView: LabelTextFieldView!
    @IBOutlet weak var passingYearView: LabelTextFieldView!
    @IBOutlet weak var cgpaView: LabelTextFieldView!

    static let reuseIdendifier: String = "EducationTableViewCell"
    var onTextchange: ((String?, EducationTextField)->Void)?
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(with viewModel: EducationCellViewModel) {
        instituteNameView.titleLabel.text = "School/University"
        courseView.titleLabel.text = "Course/Degree"
        passingYearView.titleLabel.text = "Year of Passing"
        cgpaView.titleLabel.text = "Percentage/CGPA"
        instituteNameView.textField.placeholder = "Enter here your school/university name"
        courseView.textField.placeholder = "Enter here your course/degree"
        passingYearView.textField.placeholder = "Year of Passing"
        cgpaView.textField.placeholder = "Enter here your percentage/CGPA"
        instituteNameView.textField.delegate = self
        courseView.textField.delegate = self
        passingYearView.textField.delegate = self
        instituteNameView.textField.delegate = self
        instituteNameView.textField.tag = 0
        courseView.textField.tag = 1
        passingYearView.textField.tag = 2
        cgpaView.textField.tag = 3
        
        instituteNameView.textField.text = viewModel.instituteName
        courseView.textField.text = viewModel.course
        passingYearView.textField.text = viewModel.passingYear
        cgpaView.textField.text = viewModel.cgpa
        passingYearView.textField.keyboardType = .numberPad
    }
    
}

extension EducationTableViewCell: UITextViewDelegate, UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            onTextchange?(textField.text, .name)
        } else  if textField.tag == 1 {
            onTextchange?(textField.text, .course)
        } else  if textField.tag == 2 {
            onTextchange?(textField.text, .passingYear)
        } else  if textField.tag == 3 {
            onTextchange?(textField.text, .cgpa)
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 2 {
            let maxLength = 4
            return range.location < maxLength
        }
        return true
    }
}

enum EducationTextField {
    case name
    case course
    case passingYear
    case cgpa
}
