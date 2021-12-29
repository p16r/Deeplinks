import UIKit

extension UIWindow {

    /// Sets the root view controller of the window.
    ///
    /// - Parameters:
    ///
    ///     - rootViewController:
    ///         A view controller to set as the root of this window.
    ///
    ///     - animationOptions:
    ///         An option set of animation options to perform. To set the root view controller _without_ animation,
    ///         provide `nil` to this parameter. Otherwise this parameter defaults to a flip from right transition.
    ///
    ///     - makeKeyAndVisible:
    ///         Specify `true` to make this window key and visible.
    ///
    ///     - completion:
    ///         An optional closure to be executed when the animation sequence ends. If the new controller is set
    ///         without animation, then this block is called immediately after the controller is set. This block has no
    ///         return value and takes a single Boolean argument that indicates whether or not the animations actually
    ///         finished before the completion handler was called. This parameter defaults to `nil`.
    ///
    func setRootViewController(
        to rootViewController: UIViewController,
        animationOptions: UIView.AnimationOptions? = .transitionFlipFromRight,
        makeKeyAndVisible windowShouldBeKeyAndVisible: Bool,
        completion: ((Bool) -> Void)? = nil
    ) {
        self.rootViewController = rootViewController

        if windowShouldBeKeyAndVisible {
            self.makeKeyAndVisible()
        }

        guard let options = animationOptions else {
            completion?(true)
            return
        }

        UIView.transition(with: self, duration: 0.2, options: options, animations: nil, completion: completion)
    }

}
