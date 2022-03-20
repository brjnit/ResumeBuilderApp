//
//  ProjectView.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 19/03/22.
//

import UIKit

class ProjectView: UIView {
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var teamSizeLabel: UILabel!
    @IBOutlet weak var technologyUsedLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
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
        UINib(nibName: "ProjectView", bundle: nil).instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    func configure(with project: Project) {
        projectNameLabel.text = project.projectName
        teamSizeLabel.text = project.teamSize
        technologyUsedLabel.text = project.technologyUsed
        summaryLabel.text = project.summury
    }
    
}
