//
//  WorkSummaryView.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 19/03/22.
//

import UIKit

class WorkSummaryView: UIView {
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var comapanyLabel: UILabel!

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
    
    func initSubViews() {
        UINib(nibName: "WorkSummaryView", bundle: nil).instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    private func configure(with workSummary: WorkSummary) {
        comapanyLabel.text = workSummary.companyName
        durationLabel.text = workSummary.duration
    }
}
