//
//  ComapnyTableViewCell.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 12/03/22.
//

import UIKit

class WorkSummaryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var companyView: LabelTextFieldView!
    @IBOutlet weak var durationView: LabelTextFieldView!
    static let reuseIdendifier: String = "WorkSummaryTableViewCell"
    var onTextchange: ((String?, WorkSummaryTextField)->Void)?
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(with viewModel: WorkSummaryCellViewModel) {
        companyView.textField.text = viewModel.companyName
        durationView.textField.text = viewModel.duration
        
        companyView.titleLabel.text = "Company Name"
        companyView.textField.placeholder = "Enter company name"
        companyView.textField.delegate = self
        durationView.titleLabel.text = "Duration"
        durationView.textField.placeholder = "Enter Duration"
        durationView.textField.delegate = self
        companyView.textField.tag = 0
        durationView.textField.tag = 1
        durationView.textField.keyboardType = .numberPad
    }
    
}

extension WorkSummaryTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            onTextchange?(textField.text, .companyName)
        } else  if textField.tag == 1 {
            onTextchange?(textField.text, .duration)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 1 {
            let maxLength = 4
            return range.location < maxLength
        }
        return true
    }
}


enum WorkSummaryTextField {
    case companyName
    case duration
}
