import UIKit

protocol NavigationCoordinator: Coordinator {

    associatedtype NavigationController: UINavigationController = UINavigationController

    /// The navigation controller to push and pop other controllers.
    var controller: NavigationController { get }

}
