//
//  ProfileViewController.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 09/03/22.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var addPhotoButton: UIButton!
    
    var viewModel:ProfileViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        bindViewModel()
    }
    
    private func configureView() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        registerNib()
        tableView.tableFooterView = UIView(frame: .zero)
        profileImageView.makeRounded()
        if let image = viewModel.profileImage {
            profileImageView.image = image.decodeBase64StringToImage()
        } else {
            profileImageView.image = UIImage(systemName: "person.fill.viewfinder")
        }
    }
    
    private func registerNib() {
        tableView.register(SectionHeaderView.nib, forHeaderFooterViewReuseIdentifier: SectionHeaderView.reuseIdendifier)
        //tableView.register(SectionFooterView.nib, forHeaderFooterViewReuseIdentifier: SectionFooterView.reuseIdendifier)
        tableView.register(PersonalDetailsTableViewCell.nib, forCellReuseIdentifier: PersonalDetailsTableViewCell.reuseIdendifier)
        tableView.register(SkillTableViewCell.nib, forCellReuseIdentifier: SkillTableViewCell.reuseIdendifier)
        tableView.register(ObjectiveTableViewCell.nib, forCellReuseIdentifier: ObjectiveTableViewCell.reuseIdendifier)
        tableView.register(EducationTableViewCell.nib, forCellReuseIdentifier: EducationTableViewCell.reuseIdendifier)
        tableView.register(ProjectTableViewCell.nib, forCellReuseIdentifier: ProjectTableViewCell.reuseIdendifier)
        tableView.register(ExperienceTableViewCell.nib, forCellReuseIdentifier: ExperienceTableViewCell.reuseIdendifier)
        tableView.register(WorkSummaryTableViewCell.nib, forCellReuseIdentifier: WorkSummaryTableViewCell.reuseIdendifier)
        
        
    }
    
    func bindViewModel() {
        viewModel.didUpdate = { [weak self]  in
            self?.refreshTable()
        }
        viewModel.didFail = { [weak self] error  in
            DispatchQueue.main.async { [weak self] in
                self?.showAlert(message : error ?? "")
            }
        }
    }
    @IBAction func addPhoto(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @IBAction func previewResume(_ sender: Any) {
        viewModel.navigateToPreview()
    }
    
    @IBAction func saveResume(_ sender: Any) {
        if viewModel.validateFields() {
            viewModel.createNewResume()
            dismiss()
        }
    }
    
    func dismiss() {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        }
    }
    
    private func refreshTable() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: SectionHeaderView.reuseIdendifier) as?  SectionHeaderView else {
            return nil
        }
        headerView.configureSection(header: viewModel.headerTitle(for: section))
        headerView.newButton.isHidden = true
        if viewModel.isAddNewRequired(for: section) {
            headerView.newButton.isHidden = false
            headerView.onTapNew = {[weak self] in
                self?.viewModel.addNewField(for: section)
            }
        }
        return headerView
    }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        if   viewModel.isFooterRequiered(for: section) {
//        guard let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: SectionFooterView.reuseIdendifier) as?  SectionFooterView else {
//            return nil
//        }
//        
//        //headerView.configureSection(header: viewModel.headerForSeaction(section: section))
//        return footerView
//        }
//        return nil
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.noOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.noOfRows(for: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let type = viewModel.getLayoutType(for: indexPath.section) else { return UITableViewCell() }
        switch type {
        case .personalDetails:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonalDetailsTableViewCell.reuseIdendifier) as?  PersonalDetailsTableViewCell,  let cellVm = viewModel.cellViewModel(for: indexPath) as? PersonalDetailsCellViewModel else { return UITableViewCell() }
            cell.configureCell(with: cellVm)
            cell.addShadow()
            cell.onTextchange = {(text, field) in
                cellVm.update(with: text, and: field)
            }
            cellVm.didUpdate = {[weak self] personalDetails in
                self?.viewModel.update(personalDetails: personalDetails)
            }
            return cell
        case .education:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EducationTableViewCell.reuseIdendifier) as?  EducationTableViewCell,  let cellVm = viewModel.cellViewModel(for: indexPath) as? EducationCellViewModel else { return UITableViewCell() }
            cell.configureCell(with: cellVm)
            cell.addShadow()
            cell.onTextchange = {[weak self] (text, field) in
                self?.viewModel.updateEducation(with: text, and: field, at: indexPath.row)
            }
            return cell
        case .skills:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SkillTableViewCell.reuseIdendifier) as?  SkillTableViewCell,  let cellVm = viewModel.cellViewModel(for: indexPath) as? SkillsCellViewModel else { return UITableViewCell() }
            cell.configureCell(with: cellVm)
            cell.addShadow()
            cell.onTextchange = {[weak self] text in
                self?.viewModel.updateSkills(with: text, at: indexPath.row)
            }
            return cell
        case .objective:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ObjectiveTableViewCell.reuseIdendifier) as?  ObjectiveTableViewCell,  let cellVm = viewModel.cellViewModel(for: indexPath) as? ObjectiveCellViewModel else { return UITableViewCell() }
            cell.configureCell(with: cellVm)
            cell.addShadow()
            cell.onTextchange = {[weak self] text in
                self?.viewModel.updateObjective(with: text)
            }
            return cell
        case .projects:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProjectTableViewCell.reuseIdendifier) as?  ProjectTableViewCell, let cellVm = viewModel.cellViewModel(for: indexPath) as? ProjectsCellViewModel  else { return UITableViewCell() }
            cell.configureCell(with: cellVm)
            cell.addShadow()
            cell.onTextchange = {[weak self] (text, field) in
                self?.viewModel.updateProjects(with: text, and: field, at: indexPath.row)
            }
            return cell
        case .experience:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ExperienceTableViewCell.reuseIdendifier) as?  ExperienceTableViewCell, let cellVm = viewModel.cellViewModel(for: indexPath) as? ExperienceCellViewModel  else { return UITableViewCell() }
            cell.configureCell(with: cellVm)
            cell.addShadow()
            cell.onTextchange = {[weak self] (text) in
                self?.viewModel.updateExperience(with: text)
            }
            return cell
        case .workSummary:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WorkSummaryTableViewCell.reuseIdendifier) as?  WorkSummaryTableViewCell, let cellVm = viewModel.cellViewModel(for: indexPath) as? WorkSummaryCellViewModel  else { return UITableViewCell() }
            cell.configureCell(with: cellVm)
            cell.addShadow()
            cell.onTextchange = {[weak self] (text, field) in
                self?.viewModel.updateWorkSummary(with: text, and: field, at: indexPath.row)
            }
            return cell
        }
    }
}

extension ProfileViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        profileImageView.image = image
        picker.dismiss(animated: true)
        getBase64ImageString(from: image) {[weak self] imageString in
            self?.viewModel.upload(image: imageString)
        }
    }
    
    func getBase64ImageString(from image: UIImage, complete: @escaping (String?) -> ()) {
        DispatchQueue.main.async {
            let imageData = image.pngData()
            let imageString = imageData?.base64EncodedString()
            complete(imageString)
        }
    }
}

enum LayoutType: String {
    case personalDetails = "Personal Details"
    case objective = "Objective"
    case experience = "Experience"
    case education = "Education"
    case skills = "Skills"
    case workSummary = "Work summary"
    case projects = "Projects"
}

