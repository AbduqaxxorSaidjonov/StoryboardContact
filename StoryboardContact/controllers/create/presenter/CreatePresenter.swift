//
//  CreatePresenter.swift
//  StoryboardContact
//
//  Created by Abduqaxxor on 6/8/22.
//

import Foundation

protocol CreateProtocol{
    func apiPostCreate(contact: Contact)
}

class CreatePresenterProtocol: CreateProtocol{
    
    var controller: BaseViewController!
    var createView: CreateView!
    
    func apiPostCreate(contact: Contact){
        controller?.showProgress()
        AFHttp.post(url: AFHttp.API_CONTACT_CREATE, params: AFHttp.paramsContactCreate(contact: contact), handler: {response in
            self.controller?.hideProgress()
            switch response.result{
            case .success:
                print(response.result)
                self.createView.onCreated(created: true)
            case let .failure(error):
                print(error)
                self.createView.onCreated(created: false)
            }
        })
    }
}
