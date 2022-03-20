//
//  PreviewTableViewCell.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 16/03/22.
//

import UIKit

class PreviewTableViewCell: UITableViewCell {

    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(field: String, value: String?) {
        fieldLabel.text = field
        valueLabel.text = value
    }
    
    

}
