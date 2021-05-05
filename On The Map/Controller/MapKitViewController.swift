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
        AuthorizationLogin.getStudentLocation(completion: handleStudentLocation(location:error:)
        )
    }
    func handleStudentLocation(location: [StudentLocationStruct], error: Error?) {
        DispatchQueue.main.async {
            for locations in location {
                let annotation = MKPointAnnotation()
                let latitude =  CLLocationDegrees(locations.latitude)
                let longitude = CLLocationDegrees(locations.longitude)
                annotation.coordinate = CLLocationCoordinate2D(latitude: latitude , longitude: longitude)
                self.mapView.addAnnotation(annotation)

            }
        }
    }
}


