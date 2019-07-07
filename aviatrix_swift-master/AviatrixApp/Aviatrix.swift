//
//  Aviatrix.swift
//  AviatrixApp
//
//  Created by Amy Holt on 6/10/18.
//  Copyright © 2018 Amy Holt. All rights reserved.
//

import Foundation

class Aviatrix {
    
    var running = false
    var author: String
    var data = AviatrixData()
    var location = "St. Louis"
    var distanceTraveled = 0.0
    var fuelCost = 0.0
    var difference = 0.0
    
    var milesPerGallon = 0.4
    
    var maxFuel = 6000.0
    var currentFuel = 5000.0
    
    func start() -> Bool {
        running = true
        return running
    }
    
    init(myAuthor: String) {
        author = myAuthor
    }
    
    func refuel() -> Double {
        difference = maxFuel - currentFuel
        currentFuel = maxFuel
        fuelCost = data.fuelPrices[plane.location]! * difference
        
        return difference
    }
    
    func flyTo(destination : String) {
        distanceTraveled += Double(plane.distanceTo(target: destination, location: location))
        currentFuel -= distanceTraveled*milesPerGallon
        location = destination
        
    }
    
    func distanceTo(target : String, location: String)  -> Int {
        return data.knownDistances[location]![target]!
    }
    
    func knownDestinations() -> [String] {
       return ["St. Louis", "Phoenix", "Denver", "SLC"]
    }
}
