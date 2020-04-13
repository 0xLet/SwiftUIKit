//
//  Map.swift
//  SwiftUIKit
//
//  Created by Oskar on 12/04/2020.
//

import Foundation
import MapKit

public class Map: MKMapView {
  
  var initialCoordinates: CLLocationCoordinate2D
  
  public init(lat latitude: Double,
              lon longitude: Double,
              annotations: (() -> [(latitude: CLLocationDegrees,
                                    longitude: CLLocationDegrees,
                                    title: String?,
                                    subtitle: String?)])? = nil) {
    let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    initialCoordinates = coordinates
    super.init(frame: .zero)
    let region = MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan())
    setRegion(region, animated: true)
    
    if let annotations = annotations {
      DispatchQueue.global().async { [weak self] in
        guard let self = self else { return }
        
        for (latitude, longitude, title, subtitle) in annotations() {
          let coordinate = CLLocationCoordinate2D(latitude: latitude,
                                                  longitude: longitude)
          let point = MKPointAnnotation()
          point.coordinate = coordinate
          point.title = title
          point.subtitle = subtitle
          
          DispatchQueue.main.async {
            self.addAnnotation(point)
          }
        }
      }
    }
    

    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}


extension Map {
  @discardableResult
  public func zoom(_ multiplier: Double) -> Self {
    let _center = initialCoordinates
    let _span = MKCoordinateSpan(latitudeDelta: region.span.latitudeDelta / multiplier / 10,
                                longitudeDelta: region.span.longitudeDelta / multiplier / 10)
    let _region = MKCoordinateRegion(center: _center, span: _span)
    setRegion(_region, animated: false)
    return self
  }
}
