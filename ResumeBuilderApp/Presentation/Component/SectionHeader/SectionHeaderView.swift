//
//  SectionHeaderView.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 10/03/22.
//

import UIKit

class SectionHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var newButton: UIButton!
    
    static let reuseIdendifier: String = "SectionHeaderView"
    var onTapNew: (()->Void)?
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureSection(header: String?) {
        headerLabel.text = header
    }

    @IBAction func newAction(_ sender: Any) {
        onTapNew?()
    }
}
