//
//  LoginDataModel.swift
//  LoginScreen
//
//  Created by Shereena Sunny on 10/04/22.
//

import Foundation

struct Request: Codable {
    var metadata: RequestMetadata
    var data: RequestData
}

struct RequestMetadata: Codable {
    var device_type: String = "mobile"
    var device_model: String = "Simulator iPhone11"
    var device_vendor: String = "Apple"
    var app_type: String = "shaadi"
    var app_version: String = "8.6.0"
    var entry_point: String = "direct"
    var device_id: String = "06CC65AD-A0DE-4C36-8966-93223B7FAABB"
    var autologin_flag: Bool = true
    var os_name: String = "iOS"
    var os_version: String = "15.2"
}

struct RequestData: Codable {
    var username: String
    var password: String
}

struct Result: Codable {
    var data: ResultData?
    var error: ErrorData?
}

struct ResultData: Codable {
    var uid: String
    var access_token: String
    var session_id: String
    var can_reactivate: String
    var domain: String
    var next_action: String
    var next_action_app: String
    var chat_sid: String
}

struct ErrorData: Codable {
    var api_name: String
    var message: String
    var message_shortcode: String
    var qs: String
    var status: Int
    var url: String
}
