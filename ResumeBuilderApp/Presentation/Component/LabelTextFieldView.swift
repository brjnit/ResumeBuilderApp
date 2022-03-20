//
//  LabelTextFieldView.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 08/03/22.
//

import UIKit

protocol TextViewDelegate {
    func updateTextValue(_ text: String?)
}

class LabelTextFieldView: UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet var contentView: UIView!
    var delegate: TextViewDelegate?
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubViews()
    }
    
    func initSubViews() {
        UINib(nibName: "LabelTextFieldView", bundle: nil).instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    func configureView(title: String?, textFieldString: String?) {
        titleLabel.text = title
        textField.text = textFieldString
    }
}

extension LabelTextFieldView: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.updateTextValue(textField.text)
    }
}

