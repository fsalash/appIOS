//
//  Pelicula.swift
//  appFinalFranSalas
//
//  Created by Fran on 2/3/19.
//  Copyright © 2019 Fran. All rights reserved.
//

import Foundation
import CoreData


class Pais:NSManagedObject{
    
    var name = ""
    var region = ""
    var lat = 0.0
    var long = 0.0
    var capital = ""
    var currencies = [""]
    var languages = [""]
    var population = 0
    var flag = ""
    var esfavorito = false
    var dataFlag = Data()
    
}


