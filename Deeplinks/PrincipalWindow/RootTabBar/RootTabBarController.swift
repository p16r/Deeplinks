import UIKit

/// The root tab bar controller of the app.
final class RootTabBarController: UITabBarController {

    //  MARK: - Initializers

    /// Creates a new Root Tab Bar Controller
    init() {
        super.init(nibName: nil, bundle: nil)
        let appearance = makeAppearance()
        tabBar.scrollEdgeAppearance = appearance
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //  MARK: - Instance Methods

    /// Creates the appearance of the tab bar controller
    ///
    /// - Returns: The tab bar controller's appearance.
    ///
    private func makeAppearance() -> UITabBarAppearance {
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        return appearance
    }

}
