# Map

``` swift
public class Map: MKMapView
```

## Inheritance

`MKMapView`, `MKMapViewDelegate`

## Initializers

### `init(lat:lon:points:)`

``` swift
public init(lat latitude: Double, lon longitude: Double, points: (() -> [MapPoint])? = nil)
```

### `init(region:points:)`

``` swift
convenience init(region: MKCoordinateRegion, points: (() -> [MapPoint])? = nil)
```

## Methods

### `type(_:)`

``` swift
@discardableResult func type(_ type: MKMapType) -> Self
```

### `zoomEnabled(_:)`

``` swift
@discardableResult func zoomEnabled(_ value: Bool = true) -> Self
```

### `scrollEnabled(_:)`

``` swift
@discardableResult func scrollEnabled(_ value: Bool = true) -> Self
```

### `pitchEnabled(_:)`

``` swift
@discardableResult func pitchEnabled(_ value: Bool = true) -> Self
```

### `rotateEnabled(_:)`

``` swift
@discardableResult func rotateEnabled(_ value: Bool = true) -> Self
```

### `delegate(_:)`

Note:​ If delegate isn't its own class, modifiers based on delegate's methods will do nothing.

``` swift
@discardableResult func delegate(_ delegate: MKMapViewDelegate?) -> Self
```

### `zoom(_:)`

``` swift
@discardableResult func zoom(_ multiplier: Double) -> Self
```

### `visible(rect:animate:edgePadding:)`

``` swift
@discardableResult func visible(rect: MKMapRect, animate: Bool = true, edgePadding: UIEdgeInsets? = nil) -> Self
```

### `move(to:animate:)`

Changes coordinates and span.

``` swift
@discardableResult func move(to region: MKCoordinateRegion, animate: Bool = true) -> Self
```

### `move(to:animate:)`

Changes only coordinates.

``` swift
@discardableResult func move(to coordinates: CLLocationCoordinate2D, animate: Bool = true) -> Self
```

### `center(_:animated:)`

``` swift
@discardableResult func center(_ center: CLLocationCoordinate2D, animated: Bool = true) -> Self
```

### `show(annotations:animated:)`

``` swift
@discardableResult func show(annotations: [MKAnnotation], animated: Bool = true) -> Self
```

### `show(annotations:animated:)`

``` swift
@discardableResult func show(annotations: MKAnnotation, animated: Bool = true) -> Self
```

### `camera(boundary:animated:)`

``` swift
@discardableResult func camera(boundary: MKMapView.CameraBoundary?, animated: Bool = true) -> Self
```

### `set(cameraZoomRange:animated:)`

``` swift
@discardableResult func set(cameraZoomRange: MKMapView.CameraZoomRange?, animated: Bool) -> Self
```

### `camera(_:animated:)`

``` swift
@discardableResult func camera(_ camera: MKMapCamera, animated: Bool = true) -> Self
```

### `showBuildings(_:)`

``` swift
@discardableResult func showBuildings(_ bool: Bool) -> Self
```

### `showCompass(_:)`

``` swift
@discardableResult func showCompass(_ bool: Bool) -> Self
```

### `showScale(_:)`

``` swift
@discardableResult func showScale(_ bool: Bool) -> Self
```

### `showTraffic(_:)`

``` swift
@discardableResult func showTraffic(_ bool: Bool) -> Self
```

### `pointOfInterestFilter(filter:)`

``` swift
@discardableResult func pointOfInterestFilter(filter: MKPointOfInterestFilter?) -> Self
```

### `showUserLocation(_:)`

``` swift
@discardableResult func showUserLocation(_ bool: Bool) -> Self
```

### `user(trackingMode:animated:)`

``` swift
@discardableResult func user(trackingMode: MKUserTrackingMode, animated: Bool = true) -> Self
```

### `select(annotation:animated:)`

``` swift
@discardableResult func select(annotation: MKAnnotation, animated: Bool = true) -> Self
```

### `deselect(annotation:animated:)`

``` swift
@discardableResult func deselect(annotation: MKAnnotation, animated: Bool = true) -> Self
```

### `remove(annotation:)`

``` swift
@discardableResult func remove(annotation: MKAnnotation) -> Self
```

### `remove(annotations:)`

``` swift
@discardableResult func remove(annotations: [MKAnnotation]) -> Self
```

### `add(annotation:)`

``` swift
@discardableResult func add(annotation: MKAnnotation) -> Self
```

### `add(point:)`

``` swift
@discardableResult func add(point: MapPoint) -> Self
```

### `add(annotations:)`

``` swift
@discardableResult func add(annotations: [MKAnnotation]) -> Self
```

### `add(points:)`

``` swift
@discardableResult func add(points: [MapPoint]) -> Self
```

### `register(classes:)`

``` swift
@discardableResult func register(classes: [String: AnyClass.Type]) -> Self
```

### `fitTo(region:)`

``` swift
@discardableResult func fitTo(region: MKCoordinateRegion) -> Self
```

### `fitTo(rect:edgePadding:)`

``` swift
@discardableResult func fitTo(rect: MKMapRect, edgePadding: UIEdgeInsets? = nil) -> Self
```

### `onFinishLoading(_:)`

``` swift
@discardableResult func onFinishLoading(_ handler: @escaping (MKMapView) -> ()) -> Self
```

### `afterRegionChange(_:)`

``` swift
@discardableResult func afterRegionChange(_ handler: @escaping (MKMapView) -> ()) -> Self
```

### `beforeRegionChange(_:)`

``` swift
@discardableResult func beforeRegionChange(_ handler: @escaping (MKMapView) -> ()) -> Self
```

### `configure(identifier:_:)`

``` swift
@discardableResult func configure(identifier: String?, _ annotationView: @escaping ((MKAnnotationView?, MKAnnotation) -> (MKAnnotationView?))) -> Self
```

### `onAccessoryTap(_:)`

``` swift
@discardableResult func onAccessoryTap(_ handler: @escaping (MKMapView, MKAnnotationView, UIControl) -> ()) -> Self
```

### `onAnnotationViewStateChange(_:)`

``` swift
@discardableResult func onAnnotationViewStateChange(_ handler: @escaping ((MKMapView, MKAnnotationView, MKAnnotationView.DragState, MKAnnotationView.DragState) -> ())) -> Self
```

### `onAnnotationSelect(_:)`

``` swift
@discardableResult func onAnnotationSelect(_ handler: @escaping ((MKMapView, MKAnnotationView) -> ())) -> Self
```

### `onAnnotationDeselect(_:)`

``` swift
@discardableResult func onAnnotationDeselect(_ handler: @escaping ((MKMapView, MKAnnotationView) -> ())) -> Self
```

### `mapViewDidFinishLoadingMap(_:)`

``` swift
public func mapViewDidFinishLoadingMap(_ mapView: MKMapView)
```

### `mapView(_:regionDidChangeAnimated:)`

``` swift
public func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool)
```

### `mapView(_:regionWillChangeAnimated:)`

``` swift
public func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool)
```

### `mapView(_:viewFor:)`

``` swift
public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
```

### `mapView(_:annotationView:calloutAccessoryControlTapped:)`

``` swift
public func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl)
```

### `mapView(_:annotationView:didChange:fromOldState:)`

``` swift
public func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationView.DragState, fromOldState oldState: MKAnnotationView.DragState)
```

### `mapView(_:didSelect:)`

``` swift
public func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView)
```

### `mapView(_:didDeselect:)`

``` swift
public func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView)
```
