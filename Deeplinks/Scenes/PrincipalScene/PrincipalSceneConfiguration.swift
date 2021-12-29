import UIKit

/// Configuration for the principal scene of the app.
///
class PrincipalSceneConfiguration: UISceneConfiguration {

    /// Initializes a  principal scene configuration for the given role.
    ///
    /// - Parameters:
    ///
    ///     - role:
    ///         The role of the scene. For a list of possible roles, see [UISceneSession.Role][1].
    ///
    /// [1]: (apple-reference-documentation://ls%2Fdocumentation%2Fuikit%2Fuiscenesession%2Frole)
    ///
    init(for role: UISceneSession.Role) {
        super.init(name: String(describing: Self.self), sessionRole: role)
        delegateClass = PrincipalSceneDelegate.self
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
