//
//  Users.swift
//  SwiftUIAsyncRequest
//
//  Created by Pankaj Bhalala on 14/04/20.
//  Copyright © 2020 Solution Analysts. All rights reserved.
//

import SwiftUI
import Foundation

struct User: Codable, Identifiable {
    var id: Int
    var name: String
    var userName: String
    var email: String
    var phone: String
    var website: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case userName = "username"
        case email = "email"
        case phone = "phone"
        case website = "website"
    }
}
