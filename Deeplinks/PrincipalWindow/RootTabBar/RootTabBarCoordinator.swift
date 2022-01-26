import UIKit

final class RootTabBarCoordinator: NSObject, TabBarCoordinator {

    //  MARK: - Instance Properties

    let controller: RootTabBarController

    //  MARK: TabBarCoordinator Witness Properties

    /// A map navigation coordinator whose navigation controller will be added to the tab bar.
    private let mapCoordinator: MapNavigationCoordinator

    //  MARK: - Initializers

    override init() {
        self.controller = RootTabBarController()
        mapCoordinator = MapNavigationCoordinator()
    }

    //  MARK: - TabBarCoordinator Conformance

    /// Starts the child coordinator and adds its controller to the tab bar controllers root view controllers.
    func start() {
        mapCoordinator.start()
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
        let controller = mapCoordinator.controller
        controller.tabBarItem = UITabBarItem(
            title: "Map",
            image: UIImage(systemName: "map"),
            selectedImage: UIImage(systemName: "map.fill")
        )
        return [
            controller,
        ]
    }

}
