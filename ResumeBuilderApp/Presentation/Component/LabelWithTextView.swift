//
//  LabelWithTextView.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 08/03/22.
//

import UIKit

class LabelWithTextView: UIView {
    lazy var textView: UITextView = {
      let textView = UITextView()
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.separator.cgColor
        return textView
    }();
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "", size: 14)
        return label
    }();
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubViews()
    }
    
    private func initSubViews() {
        addSubview(titleLabel)
        addSubview(textView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: textView.topAnchor, constant: -12).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        textView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        textView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        textView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        textView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureView(title: String?, textFieldString: String?) {
        titleLabel.text = title
        textView.text = textFieldString
    }
}
