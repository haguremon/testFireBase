//
//  SettingsViewController.swift
//  testFireBase
//
//  Created by IwasakIYuta on 2021/10/05.
//

import UIKit

struct EditProfileFormModel {
    let label: String
    //    let placeholder: String
    //    var value: String?
    let handler: (() -> Void)
}
//サブクラスにならない
final class SettingsViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier:"cell")
        return tableView
    }()
    
    private var models = [[EditProfileFormModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        tableView.tableHeaderView = createTableHeaderView()
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapSave))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(didTapCancel))
    }
    
    private func configureModels() {
        // Name, username, website, bio
        //let sectionOneLabels = ["Name", "Username", "Website", "Bio"]
        // let sectionOneLabels = ["logout"]
        
        let section = [
            EditProfileFormModel(label: "Log Out", handler: { [weak self]  in
                self?.didTapLogOut()
            })
            
        ]
        
        models.append(section)
        
        //        // Email, phone, gender
        //        let sectionTwoLabels = ["Email", "Phone", "Gender"]
        //        var sectionTwo = [EditProfileFormModel]()
        //        for label in sectionTwoLabels {
        //            let model = EditProfileFormModel(label: label, placeholder: "\(label)", value: nil)
        //            sectionTwo.append(model)
        //        }
        //        models.append(sectionTwo)
    }
    private func didTapLogOut () {
        let actionSheet = UIAlertController(title: "Log Out",
                                            message: "Log out 本当に？",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "cancel",style: .cancel,handler: nil))
        
        
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { _ in
            AuthManager.shared.logOut { [weak self] success in
                if success {
                    let loginVC = LoginViewController()
                    
                    loginVC.modalPresentationStyle = .fullScreen
                    self?.present(loginVC, animated: true) {
                        self?.navigationController?.popViewController(animated: false)
                        self?.tabBarController?.selectedIndex = 0
                    }
                    
                    
                } else {
                    fatalError("error desu")
                }
                
                
                
            }
            
        }))
        //下をしないとエラーが出るらしい
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        present(actionSheet, animated: true, completion: nil)
        
        
          
        }
                               

                              
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            tableView.frame = view.bounds
        }
                              
                          
                          
        private func createTableHeaderView() -> UIView {
        let header = UIView(frame: CGRect(x: 0,
                                          y: 0,
                                          width: view.width,
                                          height: view.height/4).integral)
        
        let size = header.height/1.5
        
        let profilePhotoButton = UIButton(frame: CGRect(x: (view.width-size)/2,
                                                        y: (header.height-size)/2,
                                                        width: size,
                                                        height: size))
        
        header.addSubview(profilePhotoButton)
        profilePhotoButton.layer.masksToBounds = true
        profilePhotoButton.layer.cornerRadius = size/2.0
        profilePhotoButton.tintColor = .label
        profilePhotoButton.addTarget(self,
                                     action: #selector(didTapProfilePhotoButton),
                                     for: .touchUpInside)
        profilePhotoButton.setBackgroundImage(UIImage(systemName: "person.circle"),
                                              for: .normal)
        profilePhotoButton.layer.borderWidth = 1
        profilePhotoButton.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        
        return header
    }
                          
@objc private func didTapProfilePhotoButton() {
        
    }
                          
                          
                          
// MARK: – Action
                          
    @objc private func didTapSave() {
        // Save info to database
        dismiss(animated: true,
                completion: nil)
    }
                          
                          @objc private func didTapCancel() {
        dismiss(animated: true,
                completion: nil)
    }
                          
                          @objc private func didTapChangeProfilePicture() {
        let actionSheet = UIAlertController(title: "Profile Picture",
                                            message: "Change profile picture",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose from Library", style: .default, handler: { _ in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        
        present(actionSheet, animated: true)
    }
                          
}
                          
                          // MARK: – TableView
                          
extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return models.count
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return models[section].count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let model = models[indexPath.section][indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                     for: indexPath)// as! FormTableViewCell
            cell.textLabel?.text = model.label
            return cell
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let model = models[indexPath.section][indexPath.row]
            model.handler()
        }
        
        
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            guard section == 1 else {
                return nil
            }
            
            return "Private Information"
        }
        
        
        
        
        
    }
        
        //extension EditProfileViewController: FormTableViewCellDelegate {
        //    func formTableViewCell(_ cell: FormTableViewCell, didUpdateField updatedModel: EditProfileFormModel) {
        //        // Update the model
        //    }
        //}
