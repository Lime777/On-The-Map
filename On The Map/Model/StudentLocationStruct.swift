//
//  StudentLocationStruct.swift
//  On The Map
//
//  Created by Emil Haroutunian on 4/19/21.
//

import Foundation
import UIKit

struct Results: Codable {
    let results: [StudentIdStruct]
}
struct StudentIdStruct: Codable {
 
        let createdAt: String
        let firstName: String
        let lastName: String
        var latitude: Double
        var longitude: Double
        let mapString: String
        let mediaURL: String
        let objectId: String
        let uniqueKey: String
        let updatedAt: String
}
