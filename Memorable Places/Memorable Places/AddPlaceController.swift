//
//  AddPlaceController.swift
//  Memorable Places
//
//  Created by Marc Hosecloth on 5/3/17.
//  Copyright © 2017 Marc Hosecloth. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class AddPlaceController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    let locationManager = CLLocationManager()
    var longPressRecognizer = UILongPressGestureRecognizer()
    
    var centeredOnLoad : Bool = false
    var addedPlace : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.addPlace))
        longPressRecognizer.minimumPressDuration = 1.0
        
        map.addGestureRecognizer(longPressRecognizer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        centeredOnLoad = false
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if CLLocationManager.locationServicesEnabled()
            && CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse {
            
            self.map.showsUserLocation = true
            
            if centeredOnLoad == false {
                let location = locations[0]
                let span : MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
                let region : MKCoordinateRegion = MKCoordinateRegionMake(location.coordinate, span)
                map.setRegion(region, animated: true)
                centeredOnLoad = true
            }
        }
    }
    
    func addPlace(gestureRecognizer:UIGestureRecognizer){
        let touchPoint = gestureRecognizer.location(in: map)
        let newCoordinates = map.convert(touchPoint, toCoordinateFrom: map)
        let annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinates
        map.addAnnotation(annotation)
        
        if addedPlace == false {
            AddedPlacesSharedModel.sharedModel.addedPlaces.append(newCoordinates)
            addedPlace = true
        }
        
        if longPressRecognizer.state == UIGestureRecognizerState.cancelled
            || longPressRecognizer.state == UIGestureRecognizerState.failed
            || longPressRecognizer.state == UIGestureRecognizerState.ended {
            
            addedPlace = false
        }
    }
}
