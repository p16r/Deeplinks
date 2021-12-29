import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    static let shared: AppDelegate = { delegate in
        guard let appDelegate = delegate as? AppDelegate else {
            preconditionFailure("Unexpected application delegate type")
        }
        return appDelegate
    } (UIApplication.shared.delegate)

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        true
    }

    //  MARK: UISceneSession Lifecycle

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession:
        UISceneSession, options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        PrincipalSceneConfiguration(for: connectingSceneSession.role)
    }

}
