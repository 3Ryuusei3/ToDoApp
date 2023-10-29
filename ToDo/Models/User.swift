//
//  User.swift
//  ToDo
//
//  Created by Manuel Atance on 30/9/23.
//

import Foundation


struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
