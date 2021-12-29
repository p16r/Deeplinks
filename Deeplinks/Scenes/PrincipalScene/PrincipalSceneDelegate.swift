import UIKit

/// Delegate for the principal window scene that should be loaded when the app is first launched from scratch.
///
final class PrincipalSceneDelegate: UIResponder, UIWindowSceneDelegate {

    //  MARK: - Instance Properties

    private var windowCoordinator: PrincipalWindowCoordinator!

    //  MARK: - UIWindowSceneDelegate Conformance

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else {
            fatalError("Unexpected UIScene: \(scene)")
        }
        let coordinator = PrincipalWindowCoordinator(windowScene: windowScene)
        coordinator.start()
        self.windowCoordinator = coordinator
    }

}
