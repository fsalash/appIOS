//
//  Pelicula.swift
//  appFinalFranSalas
//
//  Created by Fran on 2/3/19.
//  Copyright © 2019 Fran. All rights reserved.
//

struct Pelicula:Decodable{
    
    let title: String
    let director: String
    let release_date: String
    
}


struct Results:Decodable{
    
    let results:[Pelicula]
}
