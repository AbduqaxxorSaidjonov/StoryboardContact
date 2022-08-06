//
//  HomeView.swift
//  StoryboardContact
//
//  Created by Abduqaxxor on 6/8/22.
//

import Foundation

protocol HomeView{
    func onLoadContacts(contacts: [Contact])
    func onContactDelete(status: Bool)
}
