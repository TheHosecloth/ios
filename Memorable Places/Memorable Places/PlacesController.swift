//
//  PlacesController.swift
//  Memorable Places
//
//  Created by Marc Hosecloth on 5/2/17.
//  Copyright © 2017 Marc Hosecloth. All rights reserved.
//

import UIKit
import CoreLocation

class PlacesController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIDataSourceModelAssociation {
    @IBOutlet weak var placesTableView: UITableView!

    var places = [CLLocationCoordinate2D]()
    var placeNumber : Int = 1
    var restorationIndex : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if AddedPlacesSharedModel.sharedModel.addedPlaces.count > 0 {
            
            places.append(contentsOf: AddedPlacesSharedModel.sharedModel.addedPlaces)
            
            placesTableView.beginUpdates()
            
            let startingRow : Int = places.count - AddedPlacesSharedModel.sharedModel.addedPlaces.count
            let endingRow : Int = places.count - 1
            
            for i in startingRow..<endingRow + 1 {
                placesTableView.insertRows(at: [IndexPath(row: i, section: 0)], with: .automatic)
            }
            
            placesTableView.endUpdates()
            
            AddedPlacesSharedModel.sharedModel.addedPlaces.removeAll()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "PlaceCell")
        
        cell.textLabel?.text = "Place \(placeNumber)"
        cell.detailTextLabel?.text = "\(places[indexPath.row].latitude), \(places[indexPath.row].longitude)"
        placeNumber = placeNumber + 1
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AddedPlacesSharedModel.sharedModel.placeToShow = places[indexPath.row]
        
        let viewController = storyboard?.instantiateViewController(withIdentifier: "ShowPlace")
        self.navigationController?.pushViewController(viewController!, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            places.remove(at: indexPath.row)
            
            placesTableView.beginUpdates()
            placesTableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .automatic)
            placesTableView.endUpdates()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "Add Place" {
//            print("add place segue detected")
//        }
    }
    
    func modelIdentifierForElement(at idx: IndexPath, in view: UIView) -> String? {
        return "cell\(idx.row)"
    }
    
    func indexPathForElement(withModelIdentifier identifier: String, in view: UIView) -> IndexPath? {
        restorationIndex = restorationIndex + 1
        return IndexPath(index: restorationIndex - 1)
    }
}

