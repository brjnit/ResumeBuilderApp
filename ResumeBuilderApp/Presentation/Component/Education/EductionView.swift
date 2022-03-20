//
//  EductionView.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 19/03/22.
//

import UIKit

class EductionView: UIView {
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var instituteLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var cgpaLabel: UILabel!
    @IBOutlet var contentView: UIView!
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
    
    private func initSubViews() {
        UINib(nibName: "EductionView", bundle: nil).instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    func configure(with education: Education) {
        instituteLabel.text = education.instituteName
        courseLabel.text = education.course
        yearLabel.text = education.passingYear
        cgpaLabel.text = education.cgpa
    }
}
