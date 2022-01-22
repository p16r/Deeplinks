import UIKit

final class RootTabBarCoordinator: NSObject, TabBarCoordinator {

    //  MARK: - Instance Properties

    let controller: UITabBarController

    //  MARK: TabBarCoordinator Witness Properties

    /// A navigation coordinator whose navigation controller will be added to the tab bar.
    private let coordinator: PlaceholderNavigationCoordinator

    //  MARK: - Initializers

    override init() {
        self.controller = UITabBarController()
        coordinator = PlaceholderNavigationCoordinator()
    }

    //  MARK: - Coordinator Conformance

    /// Starts the child coordinator and adds its controller to the tab bar controllers root view controllers.
    func start() {
        coordinator.start()
        let controllers = makeViewControllers()
        controller.setViewControllers(controllers, animated: false)
    }

    //  MARK: - Instance Methods

    /// Initializes, configures, and provides the array of view controllers that will be set as the root view
    /// controllers of this tab bar controller.
    ///
    /// - Returns: The intended array of root view controllers of this tab bar controller.
    ///
    private func makeViewControllers() -> [UIViewController] {
        let controller = coordinator.controller
        return [
            controller,
        ]
    }

}
