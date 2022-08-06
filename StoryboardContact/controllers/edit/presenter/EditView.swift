//
//  EditView.swift
//  StoryboardContact
//
//  Created by Abduqaxxor on 6/8/22.
//

import Foundation

protocol EditView{
    func onLoadContact(contact: Contact) 
    func onEdited(edited: Bool)
}
