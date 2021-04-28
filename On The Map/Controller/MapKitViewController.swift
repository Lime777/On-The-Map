//
//  MapKitViewController.swift
//  On The Map
//
//  Created by Emil Haroutunian on 4/8/21.
//

import Foundation
import UIKit
import MapKit

class MapKitViewController: UIViewController, MKMapViewDelegate {
   
    
    @IBOutlet weak var mapView: MKMapView!
   
    let annotation = MKPointAnnotation()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AuthorizationLogin.getStudentLocation(completion: handleStudentLocation(location:error:)
                    )
    }
    func handleStudentLocation(location: [StudentLocationStruct], error: Error?) {
       
        annotation.coordinate = CLLocationCoordinate2D(latitude: 34 , longitude: -118.2565)
        mapView.addAnnotation(annotation)
        
        
    }
  
    }

 


