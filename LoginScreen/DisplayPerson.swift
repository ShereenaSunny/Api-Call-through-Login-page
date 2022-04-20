//
//  DisplayPerson.swift
//  LoginScreen
//
//  Created by Shereena Sunny on 14/04/22.
//

import SwiftUI

struct DisplayPerson: View {
    
    @State var result: ResultData

    var body: some View {
        VStack{
                    Text("AccessToken - \(result.access_token)")
                    Spacer()
            }
    }
}

struct DisplayPerson_Previews: PreviewProvider {
    static var previews: some View {
            DisplayPerson(result: ResultData(uid: "", access_token: "", session_id: "", can_reactivate: "", domain: "", next_action: "", next_action_app: "", chat_sid: ""))
        }
    }

