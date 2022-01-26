import UIKit
import MapKit

/// A coordinator for the map screen.
final class MapNavigationCoordinator: NSObject, NavigationCoordinator {

    //  MARK: - Instance Properties

    //  MARK: - NavigationCoordinator Witness Properties

    let controller: UINavigationController

    //  MARK: - Initializers

    override init() {
        let controller = UINavigationController()
        controller.isNavigationBarHidden = true
        self.controller = controller
    }

    //  MARK: - Coordinator Conformance

    func start() {
        let rootViewController = makeRootViewController()
        self.controller.setViewControllers([rootViewController], animated: false)
    }

    //  MARK: - Instance Methods

    private func makeRootViewController() -> UIViewController {
        let controller = MapViewController()
        return controller
    }

}
