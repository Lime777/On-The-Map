//
//  File.swift
//  On The Map
//
//  Created by Emil Haroutunian on 4/9/21.
//

import Foundation
import UIKit


class AuthorizationLogin {
    
    enum Endpoint {
        
        static let base = "https://onthemap-api.udacity.com/v1/"
        
        case udacityLogin
        case studentLocation
        
        var url: URL {
            return URL(string: self.stringValue)!
        }
        var stringValue: String {
            switch self {
            
            case .udacityLogin: return AuthorizationLogin.Endpoint.base + "session"
            case .studentLocation: return  AuthorizationLogin.Endpoint.base + "StudentLocation"
                
            }
        }
    }
    
    class func login(username: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        var request = URLRequest(url: URL(string: "https://onthemap-api.udacity.com/v1/session")!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        // encoding a JSON body from a string, can also use a Codable struct
        request.httpBody = "{\"udacity\": {\"username\": \"\(username)\", \"password\": \"\(password)\"}}".data(using: .utf8)
        print(username)
        print(password)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil { // Handle error…
                return
                    completion(false, error)
            }
            let range = (5..<data!.count)
            let newData = data?.subdata(in: range) /* subset response data! */
            
            do {
                let decoder = try JSONDecoder().decode(LoginSession.self, from: newData!)
                let sessionID = decoder.session.id
                let sessionExpiration = decoder.session.expiration
                let accountID = decoder.account.key
                let accountRegistered = decoder.account.registered
                print("______ACCOUNT LOGIN INFORMATION______")
                print("Session I.D. = \(sessionID)")
                print("Session Expiration = \(sessionExpiration)")
                print("Account ID = \(accountID)")
                print("Account Registered = \(accountRegistered)")
                completion(true, nil)
            } catch {
                print(error.localizedDescription)
                completion(false, error)
            }
        }
        task.resume()
    }
    
    class func getStudentLocation(completion: @escaping ([StudentLocationStruct], Error?) -> Void) {
        let request = URLRequest(url: AuthorizationLogin.Endpoint.studentLocation.url)
        let sessionTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completion([], error)
                return
            }
            do {
                let decoder = try JSONDecoder().decode(Results.self, from: data)
                decoder.results.forEach { location in
                    print("EMIL, THIS IS THE LOCATION: \(location.latitude) & \(location.longitude)")
                }
                
            } catch {
                print("Get student location function error: \(error.localizedDescription)")
                completion([], error)
            }
        }
        sessionTask.resume()
    }
}


