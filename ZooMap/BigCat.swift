//
//  BigCat.swift
//  ZooMap
//
//  Created by Caroline Port on 10/13/18.
//  Copyright © 2018 Caroline Port. All rights reserved.
//

import Foundation
import MapKit
import UIKit
//created the exhibit types to use later for coloring
enum ExhibitType {
    case redRocks
    case riversEdge
    case discoveryCorner
    case lakesideCrossing
    case theWild
    case historicHill
}
class Exhibits: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    let fact: String
    let type: ExhibitType
    
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D, fact: String, type:ExhibitType) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        self.fact = fact
        self.type = type
        
        super.init()
    }
    var subtitle: String? {
        return locationName
    }
}











