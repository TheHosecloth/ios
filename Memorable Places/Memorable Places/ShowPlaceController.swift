//
//  ShowPlaceController.swift
//  Memorable Places
//
//  Created by Marc Hosecloth on 5/4/17.
//  Copyright © 2017 Marc Hosecloth. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ShowPlaceController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = AddedPlacesSharedModel.sharedModel.placeToShow
        map.addAnnotation(annotation)
        
        let span : MKCoordinateSpan = MKCoordinateSpanMake(0.25, 0.25)
        let region : MKCoordinateRegion = MKCoordinateRegionMake(AddedPlacesSharedModel.sharedModel.placeToShow, span)
        map.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if CLLocationManager.locationServicesEnabled()
            && CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse {
            
            self.map.showsUserLocation = true
        }
    }
}
