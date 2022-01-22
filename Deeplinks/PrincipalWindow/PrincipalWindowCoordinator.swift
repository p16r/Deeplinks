import UIKit

final class PrincipalWindowCoordinator: NSObject, WindowCoordinator {

    //  MARK: - Instance Properties

    /// The coordinator responsible for the window's root view controller.
    private let rootCoordinator: RootTabBarCoordinator

    //  MARK: WindowCoordinator Witness Properties

    let window: UIWindow

    //  MARK: - Initializers

    /// Initializes a window coordinator for the provided `UIWindow`.
    ///
    /// - Parameters:
    ///
    ///     - window:
    ///         The window that this coordinator will manage.
    ///
    init(window: UIWindow) {
        self.window = window
        self.rootCoordinator = RootTabBarCoordinator()
        super.init()
    }

    /// Initializes a window coordinator for the provided `UIScene`. This initializer will fail if the scene passed is
    /// not a `UIWindowScene` instance.
    ///
    /// - Parameters:
    ///
    ///     - scene:
    ///         The scene which may be used to initialize this coordinator's window.
    ///
    convenience init(windowScene: UIWindowScene) {
        self.init(window: UIWindow(windowScene: windowScene))
    }

    //  MARK: - Coordinator Conformance

    /// Instantiates a `PlaceholderNavigationCoordinator`, and sets its navigation controller as the root view
    /// controller of this coordinator's window.
    ///
    func start() {
        rootCoordinator.start()
        let controller = rootCoordinator.controller
        window.setRootViewController(to: controller, animationOptions: nil, makeKeyAndVisible: true)
    }

}
