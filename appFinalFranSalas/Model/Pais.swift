//
//  Pelicula.swift
//  appFinalFranSalas
//
//  Created by Fran on 2/3/19.
//  Copyright © 2019 Fran. All rights reserved.

// Clase usada para pintar todo cuando no estaba usando CoreData. La mantengo para uso local en la aplicacion para ir pintando cosas a modo de modeloLocal y la de coreData para persistir y almacenar en el contexto los Paisesfavoritos

import Foundation
import CoreData


class Pais{
    
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


