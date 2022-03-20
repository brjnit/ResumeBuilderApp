//
//  PersonalDetailsTableViewCell.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 10/03/22.
//

import UIKit

class PersonalDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameView: LabelTextFieldView!
    @IBOutlet weak var addressView: LabelWithTextView!
    @IBOutlet weak var emailView: LabelTextFieldView!
    @IBOutlet weak var phoneView: LabelTextFieldView!
    
    static let reuseIdendifier: String = "PersonalDetailsTableViewCell"
    var onTextchange: ((String?, PersonalDetailsTextField)->Void)?
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(with viewModel: PersonalDetailsCellViewModel) {
        nameView.textField.text = viewModel.name
        addressView.textView.text = viewModel.address
        emailView.textField.text = viewModel.email
        phoneView.textField.text = viewModel.phone
        setUpView()
    }
    
    func setUpView() {
        nameView.titleLabel.text = "Name"
        addressView.titleLabel.text = "Address"
        emailView.titleLabel.text = "Email"
        phoneView.titleLabel.text = "Phone Number"
        nameView.textField.placeholder = "Enter your name"
        emailView.textField.placeholder = "Enter your email"
        phoneView.textField.placeholder = "Enter your phone number"
        nameView.textField.delegate = self
        addressView.textView.delegate = self
        emailView.textField.delegate = self
        phoneView.textField.delegate = self
        nameView.textField.tag = 0
        addressView.textView.tag = 1
        emailView.textField.tag = 2
        phoneView.textField.tag = 3
        phoneView.textField.keyboardType = .numberPad
        self.addDropShadow()
    }
    
}

extension PersonalDetailsTableViewCell: UITextViewDelegate, UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.tag == 0 {
            onTextchange?(textView.text, .name)
        } else  if textView.tag == 1 {
            onTextchange?(textView.text, .address)
        } else  if textView.tag == 2 {
            onTextchange?(textView.text, .email)
        } else  if textView.tag == 3 {
            onTextchange?(textView.text, .phone)
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            onTextchange?(textField.text, .name)
        } else  if textField.tag == 1 {
            onTextchange?(textField.text, .address)
        } else  if textField.tag == 2 {
            onTextchange?(textField.text, .email)
        } else  if textField.tag == 3 {
            onTextchange?(textField.text, .phone)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 3 {
            let maxLength = 10
            return range.location < maxLength
        }
        return true
    }
}

enum PersonalDetailsTextField {
    case name
    case address
    case email
    case phone
}

struct PersonalDetailsCellModel {
    let name: String?
    let address: String?
    let email: String?
    let phone: String?
}
