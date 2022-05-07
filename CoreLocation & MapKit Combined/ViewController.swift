//
//  ViewController.swift
//  CoreLocation & MapKit Combined
//
//  Created by Ömer Faruk Kılıçaslan on 7.05.2022.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var hizLabel: UILabel!
    @IBOutlet weak var boylamLabel: UILabel!
    @IBOutlet weak var enlemLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager:CLLocationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }


}

extension ViewController:CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let sonKonum:CLLocation = locations[locations.count - 1]
        
        enlemLabel.text = "Enlem \(sonKonum.coordinate.latitude)"
        boylamLabel.text = "Boylam \(sonKonum.coordinate.longitude)"
        hizLabel.text = "Hız \(sonKonum.speed)"
        
        
        let konum = CLLocationCoordinate2D(latitude: sonKonum.coordinate.latitude, longitude: sonKonum.coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
        let bolge = MKCoordinateRegion(center: konum, span: span)
        
        mapView.setRegion(bolge, animated: true)
        
        mapView.showsUserLocation = true
    }
}
