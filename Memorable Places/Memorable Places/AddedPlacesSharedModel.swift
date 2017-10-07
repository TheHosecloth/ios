//
//  AddedPlacesSharedModel.swift
//  Memorable Places
//
//  Created by Marc Hosecloth on 5/3/17.
//  Copyright © 2017 Marc Hosecloth. All rights reserved.
//

import CoreLocation

class AddedPlacesSharedModel {
    static let sharedModel = AddedPlacesSharedModel()
    var addedPlaces = [CLLocationCoordinate2D]()
    var placeToShow = CLLocationCoordinate2D()
}
