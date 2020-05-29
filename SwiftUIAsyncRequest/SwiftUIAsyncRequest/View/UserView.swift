//
//  UserView.swift
//  SwiftUIAsyncRequest
//
//  Created by Pankaj Bhalala on 14/04/20.
//  Copyright © 2020 Solution Analysts. All rights reserved.
//

import SwiftUI

struct UserView : View {
    @ObservedObject var users = Resource(endpoint: getMethodRequest(endpoint: "users"))
    var body: some View {
        Group {
            if users.value == nil {
                Text("Loading...")
            } else {
                VStack {
                    Text(users.value![0].name).bold()
                }
            }
        }
    }
}
