//
//  ListData.swift
//  ListAndSortByLocation
//
//  Created by Nikhil B Kuriakose on 21/06/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import SwiftUI
import CoreLocation

class PickUpDataType: Identifiable {
    var id = UUID()
    var company: String
    var address: String
    var city: String
    var location: CLLocation?
    var active: Bool
    var distance: Double = 0
    
    init( company: String, address1: String, address2: String, city: String, location: CLLocation, active: Bool, distance: Double = 0) {
        self.distance = distance
        self.company = company
        self.city = city
        self.location = location
        self.active = active
        
        if (address2 != "") {
            self.address = address1 + ", " + address2
        } else {
            self.address = address1
        }
    }
}



let mockData: [PickUpDataType] = [
    PickUpDataType(company: "Goodbits", address1: "Infopark", address2: "Kakkanad", city: "Ernakulam", location: CLLocation(latitude: 10.006170, longitude: 76.366501), active: true),
    PickUpDataType(company: "Company 1", address1: "Brahmapuram", address2: "Kakkanad", city: "Ernakulam", location: CLLocation(latitude: 10.006170, longitude: 76.366401), active: false),
    PickUpDataType(company: "Company 2", address1: "Infopark", address2: "Kakkanad", city: "Ernakulam", location: CLLocation(latitude: 10.006170, longitude: 75.366501), active: true),
    PickUpDataType(company: "Goodbits", address1: "Infopark", address2: "Kakkanad", city: "Ernakulam", location: CLLocation(latitude: 11.006170, longitude: 76.366501), active: true),
    PickUpDataType(company: "Goodbits", address1: "Infopark", address2: "Kakkanad", city: "Ernakulam", location: CLLocation(latitude: 10.006170, longitude: 76.366501), active: true),
    PickUpDataType(company: "Goodbits", address1: "Infopark", address2: "Kakkanad", city: "Ernakulam", location: CLLocation(latitude: 10.006170, longitude: 76.366501), active: true),
    PickUpDataType(company: "Goodbits", address1: "Infopark", address2: "Kakkanad", city: "Ernakulam", location: CLLocation(latitude: 10.006170, longitude: 76.366501), active: true),
    PickUpDataType(company: "Goodbits", address1: "Infopark", address2: "Kakkanad", city: "Ernakulam", location: CLLocation(latitude: 10.006170, longitude: 76.366501), active: false)

]

