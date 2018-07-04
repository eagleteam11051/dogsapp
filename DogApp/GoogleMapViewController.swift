//
//  GoogleMapViewController.swift
//  DogApp
//
//  Created by Admin on 7/4/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import GoogleMaps

class VacationDestination: NSObject {
    let name: String
    let location: CLLocationCoordinate2D
    let zoom: Float
    
    init(name:String, location: CLLocationCoordinate2D,zoom: Float){
        self.name = name
        self.location = location
        self.zoom = zoom
    }
}

class GoogleMapViewController: UIViewController {
    var mapView:GMSMapView
    var currentDestination: VacationDestination?
    let destinations = [VacationDestination(name: "SFD airport", location: CLLocationCoordinate2D(latitude: 21.585219, longitude: 105.806863), zoom: 15)]
    override func viewDidLoad() {
        super.viewDidLoad()
        GMSServices.provideAPIKey("AIzaSyD2kiwgq9e1qFi-z2-iEzdcbvloSNOweBo")
        let camera = GMSCameraPosition.camera(withLatitude: 21.594914, longitude: 105.811873, zoom: 6.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let currentLocation = CLLocationCoordinate2DMake(21.594914, 105.811873)
        let market = GMSMarker(position: currentLocation)
        market.title = "Tesst"
        market.map = mapView
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: "next")
        
    }
    func next(){
        if currentDestination == nil{
           currentDestination  = destinations.first
            mapView.camera = GMSCameraPosition.camera(withTarget: (currentDestination?.location)!, zoom: 15)
            let market = GMSMarker(position: (currentDestination?.location)!)
            market.title = currentDestination?.name
            market.snippet = "Dong 2"
            market.map = mapView
        }
//
//        let nextLocation = CLLocationCoordinate2DMake(21.585219, 105.806863)
//        mapView.camera = GMSCameraPosition.camera(withLatitude: currentDestination!.location , zoom: currentDestination!.zoom)
        
    }

   

}
