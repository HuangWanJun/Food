//
//  MapViewController.swift
//  Food
//
//  Created by Samuelhuang on 20/3/2016.
//  Copyright © 2016年 Samuelhuang. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController ,MKMapViewDelegate{

    @IBOutlet weak var mapView: MKMapView!
    var canteen:Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //github
        //second 
        mapView.delegate = self
        
        mapView.showsTraffic = true
        mapView.showsUserLocation = true
        mapView.showsCompass = true
        mapView.showsScale = true
        mapView.showsBuildings = true
        
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(canteen.location!) { (placemarks, error) -> Void in
            if error != nil {
                print(error)
                return
            }
            
            if let marks = placemarks {
                let placeMark = marks[0]
                
                let annotation = MKPointAnnotation()
                annotation.title = self.canteen.name
                annotation.subtitle = self.canteen.type
                
                if let loaction = placeMark.location {
                
                    annotation.coordinate = loaction.coordinate
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
        }
        
        
        
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let id = "MY Pin"
        
        if annotation is MKUserLocation {
            return nil
        }
        
        var annotationView = self.mapView.dequeueReusableAnnotationViewWithIdentifier(id) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: id)
            annotationView?.canShowCallout = true
            
        }
        
        let imageView = UIImageView(frame: CGRectMake(0, 0, 53, 53))
        //imageView.image = UIImage(named: canteen.image)
        imageView.image = UIImage(data: canteen.image!)
        annotationView?.leftCalloutAccessoryView = imageView
        annotationView?.pinTintColor = UIColor.greenColor()
        
        return annotationView
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    


}
