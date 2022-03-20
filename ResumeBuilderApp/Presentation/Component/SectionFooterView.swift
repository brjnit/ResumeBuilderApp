//
//  SectionFooterView.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 10/03/22.
//

import UIKit

class SectionFooterView: UITableViewHeaderFooterView {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    static let reuseIdendifier: String = "SectionFooterView"
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureSection(header: String?) {
       
    }
    
    @IBAction func addAction(_ sender: Any) {
    }
    
    @IBAction func saveAction(_ sender: Any) {
    }
    
}
