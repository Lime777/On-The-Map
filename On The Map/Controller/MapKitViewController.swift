//
//  MapKitViewController.swift
//  On The Map
//
//  Created by Emil Haroutunian on 4/8/21.
//

import Foundation
import UIKit
import MapKit

class MapKitViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AuthorizationLogin.getStudentLocation(completion: handleStudentInformation(id:error:))
    }
    func handleStudentInformation(id: [StudentIdStruct], error: Error?) {
        DispatchQueue.main.async {
            for information in id {
                let annotation = MKPointAnnotation()
            
                let latitude =  CLLocationDegrees(information.latitude)
                let longitude = CLLocationDegrees(information.longitude)
                annotation.coordinate = CLLocationCoordinate2D(latitude: latitude , longitude: longitude)
                annotation.title = information.firstName
                annotation.subtitle = information.lastName
                self.mapView.addAnnotation(annotation)
//              print("Testing out First names: \(information.firstName)")

            }
        }
    }
}

extension MapKitViewController: MKMapViewDelegate {

}


