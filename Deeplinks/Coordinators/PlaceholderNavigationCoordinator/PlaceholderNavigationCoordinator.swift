import UIKit

final class PlaceholderNavigationCoordinator: NSObject, NavigationCoordinator {

    //  MARK: - Instance Properties

    private let text: String

    //  MARK: NavigationCoordinator Witness Properties

    let controller: UINavigationController

    //  MARK: - Initializers

    /// Initializes a navigation coordinator with a `UINavigationController`.
    ///
    init(text: String = "Hello, World!") {
        self.text = text
        self.controller = UINavigationController()
        super.init()
    }

    //  MARK: - Coordinator Conformance

    /// Pushes the root view controller onto the navigation stack.
    ///
    func start() {
        let rootViewController = makeRootViewController()
        self.controller.setViewControllers([rootViewController], animated: false)
    }

    //  MARK: - Instance Methods

    /// Initializes, configures, and provides the view controller that will be set as the root view controller of this
    /// controller's navigation controller.
    ///
    /// - Returns: The intended root view controller of this controller's navigation controller.
    ///
    private func makeRootViewController() -> UIViewController {
        let controller = PlaceholderViewController(text: text)
        return controller
    }

}
