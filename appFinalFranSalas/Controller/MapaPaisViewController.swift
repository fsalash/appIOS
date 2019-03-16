//
//  MapaPaisViewController.swift
//  appFinalFranSalas
//
//  Created by Fran on 16/3/19.
//  Copyright © 2019 Fran. All rights reserved.
//

import UIKit
import MapKit

class MapaPaisViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var mapaPais: MKMapView!
    
    
    var latitud = 0.0
    var longitud = 0.0
    var nombrePais = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapaPais.delegate = self

        let latitude:CLLocationDegrees = latitud
        let longitude:CLLocationDegrees = longitud
        
        print ("latitud: --> \(latitud)")
        print ("longitud: --> \(longitud)")
        
        //ejemplo http://www.codemaycauseheadache.com/2016/01/24/swift-mapa-marcadores-personalizado-mapkit/
        let latDelta:CLLocationDegrees = 60
        let longDelta:CLLocationDegrees = 60
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitud, longitud)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)

        mapaPais.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        
        if(latitud == 0.0 && longitude == 0.0){
            annotation.title = "No se ha podido recupear la latitud/longitud del pais"
        }
        else{
            annotation.title = nombrePais
        }
        
        
        mapaPais.addAnnotation(annotation)
        
        // Do any additional setup after loading the view.
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
