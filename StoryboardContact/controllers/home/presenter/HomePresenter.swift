//
//  HomePresenter.swift
//  StoryboardContact
//
//  Created by Abduqaxxor on 6/8/22.
//

import Foundation

protocol HomePresenterProtocol{
    func apiContactList()
    func apiContactDelete(contact: Contact)
}

class HomePresenter: HomePresenterProtocol{
    
    var controller: BaseViewController!
    var homeView: HomeView!
    
    func apiContactList(){
        controller?.showProgress()
        AFHttp.get(url: AFHttp.API_CONTACT_LIST, params: AFHttp.paramsEmpty(), handler: {response in
            self.controller?.hideProgress()
            switch response.result{
            case .success:
                let contacts = try! JSONDecoder().decode([Contact].self, from: response.data!)
                self.homeView.onLoadContacts(contacts: contacts)
            case let .failure(error):
                print(error)
                self.homeView.onLoadContacts(contacts: [Contact]())
            }
        })
    }
    
    func apiContactDelete(contact: Contact){
        controller?.showProgress()
        AFHttp.del(url: AFHttp.API_CONTACT_DELETE + contact.id!, params: AFHttp.paramsEmpty(), handler: { response in
            self.controller?.hideProgress()
            switch response.result{
            case .success:
                print(response.result)
                self.homeView.onContactDelete(status: true)
            case let .failure(error):
                print(error)
                self.homeView.onContactDelete(status: false)
            }
        })
    }
    
    
}
