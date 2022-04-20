//
//  PersonViewModel.swift
//  LoginScreen
//
//  Created by Shereena Sunny on 14/04/22.
//

import Foundation

class PersonViewModel: ObservableObject{
    
    @Published var result: ResultData? = nil
    @Published var isLoginSuccessful = false

    func fetchPerson(username : String, password : String) {
        
        guard let url = URL(string: "http://ww4.shaadi.com/api/users/login") else {
            print("Error: cannot create URL")
            return
        }
            
        let requestModel = RequestData(username: username, password: password)
        let request = Request(metadata: RequestMetadata(), data: requestModel)
        
        guard let jsonData = try? JSONEncoder().encode(request) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        
        var urlrequest = URLRequest(url: url)
        urlrequest.httpMethod = "POST"
        urlrequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlrequest.setValue("direct", forHTTPHeaderField: "x-entpt")
        urlrequest.setValue("8.6.0", forHTTPHeaderField: "x-appver")
        urlrequest.setValue("06CC65AD-A0DE-4C36-8966-93223B7FAABB", forHTTPHeaderField: "x-device")
        urlrequest.setValue("native-iphone", forHTTPHeaderField: "x-device-os")
        urlrequest.setValue("f3160fdfda232eead68981befa43b0f19c4e23ab9a665f5a78253ebfc025354c", forHTTPHeaderField: "X-App-Key")
        urlrequest.setValue("", forHTTPHeaderField: "x-session-id")
        urlrequest.httpBody = jsonData
        
        
        URLSession.shared.dataTask(with: urlrequest) { data, response, error in
                   
            DispatchQueue.main.async {
                        
                guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            
            do {
                let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSDictionary
                print(jsonObject)
                
                guard let finalPerson = try? JSONDecoder().decode(Result.self, from : data) else {
                        print("Error: Couldn't decode data")
                            return
                }
                self.isLoginSuccessful = true
                
                print(finalPerson)
                self.result = finalPerson.data
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
            }
        }.resume()
    }
    
}
