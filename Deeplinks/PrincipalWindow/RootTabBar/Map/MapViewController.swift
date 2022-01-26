import MapKit

/// A view controller that displays a map.
final class MapViewController: UIViewController, MKMapViewDelegate {

    //  MARK: - Instance Properties

    //  MARK: Computed Properties

    private var mapView: MKMapView {
        view as! MKMapView
    }

    //  MARK: - Initializers

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //  MARK: - View Lifecycle

    override func loadView() {
        view = MKMapView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let recognizer = makeRecognizer()
        mapView.addGestureRecognizer(recognizer)
        mapView.delegate = self
    }

    //  MARK: - Instance Methods

    /// Makes a gesture recognizer that handles a long press.
    ///
    /// - Returns: The gesture recognizer that handles a long press.
    ///
    private func makeRecognizer() -> UILongPressGestureRecognizer {
        let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        return recognizer
    }

    /// The action for a long press recognizer
    ///
    /// - Parameter recognizer: The recognizer to handle.
    ///
    @objc private func handleLongPress(_ recognizer: UILongPressGestureRecognizer) {
        guard recognizer.state == .ended else { return }
        let mapView = self.mapView
        let locationOnMap = mapView.convert(recognizer.location(in: mapView), toCoordinateFrom: mapView)
        let annotation = makeAnnotation(at: locationOnMap)
        mapView.addAnnotation(annotation)
    }

    /// Makes an annotation for the given coordinate.
    ///
    /// - Parameters:
    ///
    ///     - coordinate: The coordinate at which to make the annotation.
    ///
    /// - Returns: The annotation at eh given coordinate.
    ///
    private func makeAnnotation(at coordinate: CLLocationCoordinate2D) -> MKAnnotation {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        setAnnotation(annotation, titleWithPrecision: 3)
        return annotation
    }

    /// Sets the title of the annotation to a string representation of the coordinate to the given precision.
    ///
    /// - Parameters:
    ///
    ///     - annotation: The annotation to set the title of.
    ///
    ///     - precision: The precision to which to set the coordinate values.
    ///
    private func setAnnotation(_ annotation: MKPointAnnotation, titleWithPrecision precision: Int) {
        let coordinate = annotation.coordinate
        let precision = FloatingPointFormatStyle<CLLocationDegrees>.number.precision(.fractionLength(precision))
        let latitude = coordinate.latitude.formatted(precision)
        let longitude = coordinate.longitude.formatted(precision)
        annotation.title = "\(latitude), \(longitude)"
    }

    //  MARK: - MKMapViewDelegate Conformance

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? MKPointAnnotation else { return }
        setAnnotation(annotation, titleWithPrecision: 6)
    }

    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        guard let annotation = view.annotation as? MKPointAnnotation else { return }
        setAnnotation(annotation, titleWithPrecision: 3)
    }

}
