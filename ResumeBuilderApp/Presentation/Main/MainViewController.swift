//
//  ViewController.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 08/03/22.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel:ChooseProfileViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: .zero)
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.fetchResumes()
    }
    
    func bindViewModel() {
        viewModel.didUpdate = { [weak self]  in
            self?.tableView.reloadData()
        }
        
        viewModel.didFail = { [weak self] errorMessage in
            self?.showAlert(message: errorMessage)
        }
    }
    
    @IBAction func createNewResumeAction(_ sender: Any) {
        viewModel.createNewResume()
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.noOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProfileTableViewCell.self), for: indexPath) as? ProfileTableViewCell,  let cellVm = viewModel.cellViewModel(for: indexPath) else { return UITableViewCell() }
        
        cell.configureCell(model: cellVm)
        cell.onEdit = {[weak self] in
            self?.viewModel.onEditResume(for: indexPath)
        }
        cell.onDelete = {[weak self] in
            self?.viewModel.onDeleteResume(for: indexPath)
        }
        return cell
    }    
}
