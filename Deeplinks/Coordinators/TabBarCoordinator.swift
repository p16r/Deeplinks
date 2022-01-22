import UIKit

protocol TabBarCoordinator: Coordinator {

    associatedtype TabBarController: UITabBarController = UITabBarController

    /// The tab bar controller to hold other view controllers.
    var controller: TabBarController { get }

}
