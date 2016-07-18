//
//  weatherParameters.swift
//  UV APP
//
//  Created by Macbook Pro on 7/18/16.
//  Copyright © 2016 Clyff IOS supercompany. All rights reserved.
//

import Foundation

class weatherParameters {
    
    var spFactor : String
    var airPressure : String
    var humidity : String
    var skyDescription : String
    var tempF : String
    
    init(spFactor:String, airPressure:String, humidity:String, skyDescription:String, tempF:String) {
        self.spFactor = spFactor
        self.airPressure = airPressure
        self.humidity = humidity
        self.skyDescription = skyDescription
        self.tempF = tempF
    }
    
}
