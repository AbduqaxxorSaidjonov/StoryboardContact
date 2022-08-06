//
//  EditPresenter.swift
//  StoryboardContact
//
//  Created by Abduqaxxor on 6/8/22.
//

import Foundation

protocol EditPresenterProtocol{
    func apiSingleContact(contactId: String)
    func apiContactEdit(contactId: String, contact: Contact)
}

class EditPresenter: EditPresenterProtocol{
    
    var controller: BaseViewController!
    var editView: EditView!
    
    func apiSingleContact(contactId: String){
        controller?.showProgress()
        AFHttp.get(url: AFHttp.API_CONTACT_SINGLE + contactId, params: AFHttp.paramsEmpty(), handler: { response in
            self.controller?.hideProgress()
            switch response.result {
            case .success:
                print(response.result)
                let contacts = try! JSONDecoder().decode(Contact.self, from: response.data!)
                self.editView.onLoadContact(contact: contacts)
            case let .failure(error):
                print(error)
            }
        })
    }
    
    func apiContactEdit(contactId: String, contact: Contact){
        controller?.showProgress()
        AFHttp.put(url: AFHttp.API_CONTACT_UPDATE + contactId, params: AFHttp.paramsPostUpdate(contact: contact), handler: {response in
            self.controller?.hideProgress()
            switch response.result{
            case .success:
                print(response.result)
                self.editView.onEdited(edited: true)
            case let .failure(error):
                print(error)
                self.editView.onEdited(edited: false)
            }
        })
    }
}
