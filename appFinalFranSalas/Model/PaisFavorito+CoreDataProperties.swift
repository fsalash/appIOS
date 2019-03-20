//
//  PaisFavorito+CoreDataProperties.swift
//  
//
//  Created by Fran on 20/3/19.
//
//

import Foundation
import CoreData


extension PaisFavorito {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PaisFavorito> {
        return NSFetchRequest<PaisFavorito>(entityName: "PaisFavorito")
    }

    @NSManaged public var capital: String?
    @NSManaged public var dataFlag: NSObject?
    @NSManaged public var idiomas: NSObject?
    @NSManaged public var latitud: Float
    @NSManaged public var longitud: Float
    @NSManaged public var monedas: NSObject?
    @NSManaged public var nombre: String?
    @NSManaged public var poblacion: Int32
    @NSManaged public var region: String?

}
