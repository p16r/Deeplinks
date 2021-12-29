import UIKit

protocol WindowCoordinator: Coordinator {

    associatedtype Window: UIWindow = UIWindow

    /// The window managed by this coordinator.
    var window: Window { get }

}
