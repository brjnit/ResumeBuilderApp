//
//  ObjectiveTableViewCell.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 10/03/22.
//

import UIKit

class ObjectiveTableViewCell: UITableViewCell {
    @IBOutlet weak var objectiveView: LabelWithTextView!
    static let reuseIdendifier: String = "ObjectiveTableViewCell"
    var onTextchange: ((String?)->Void)?
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(with viewModel: ObjectiveCellViewModel) {
        objectiveView.textView.text = viewModel.objective
        objectiveView.textView.delegate = self
    }
    
}

extension ObjectiveTableViewCell: UITextViewDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//    
    func textViewDidEndEditing(_ textView: UITextView) {
        onTextchange?(textView.text)
    }
}
