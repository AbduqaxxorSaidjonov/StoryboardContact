//
//  EditViewController.swift
//  StoryboardContact
//
//  Created by Abduqaxxor on 19/7/22.
//

import UIKit

class EditViewController: BaseViewController, EditView {
   
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var buttonEdit: UIButton!
    var ContactId: String = "1"
    var presenter: EditPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }

    func initViews(){
        buttonEdit.layer.cornerRadius = 15
        initNavigation()
        presenter?.apiSingleContact(contactId: ContactId)
        presenter = EditPresenter()
        presenter.editView = self
        presenter.controller = self
    }
    
    func initNavigation(){
        title = "Edit Contact"
        let back = UIImage(systemName: "chevron.backward")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(leftTapped))
    }
    
    @IBAction func editButton(_ sender: Any) {
        presenter?.apiContactEdit(contactId: ContactId, contact: Contact(name: nameTextField.text!, phone: phoneTextField.text!))
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "edit"), object: nil)
    }
    
    @objc func leftTapped(){
        dismiss(animated: true, completion: nil)
    }
    
    func onLoadContact(contact: Contact){
        if contact != nil{
            self.nameTextField.text = contact.name
            self.phoneTextField.text = contact.phone
        }else{
            //error
        }
    }
    
    func onEdited(edited: Bool) {
        if edited{
            self.dismiss(animated: true,completion: nil)
        }else{
            //error
        }
    }
}
