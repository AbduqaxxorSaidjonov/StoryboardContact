//
//  CreateViewController.swift
//  StoryboardContact
//
//  Created by Abduqaxxor on 19/7/22.
//

import UIKit

class CreateViewController: BaseViewController, CreateView {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    var presenter: CreatePresenterProtocol!
    
    @IBAction func addButton(_ sender: Any) {
        presenter.apiPostCreate(contact: Contact(name: nameTextField.text!, phone: phoneTextField.text!))
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    @IBOutlet weak var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
    }

    func initViews(){
        initNavigation()
        button1.layer.cornerRadius = 15
        presenter = CreatePresenterProtocol()
        presenter.createView = self
        presenter.controller = self
    }
    
    func initNavigation(){
        title = "Add Contact"
        let back = UIImage(systemName: "chevron.backward")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(leftTapped))
    }
    
    @objc func leftTapped(){
        navigationController?.popViewController(animated: true)
    }
    
    func onCreated(created: Bool) {
        if created{
            self.navigationController?.popViewController(animated: true)
        }else{
            //error
        }
        
    }
    
}
