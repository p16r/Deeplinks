import UIKit

/// An uninhabited type to use for configuring a view with Autolayout.
enum WithAutolayout<View: UIView> {

    /// Enables Autolayout and configures a given view with the given closure
    ///
    /// - Parameters:
    ///
    ///     - view:
    ///         The view to configure.
    ///
    ///     - configurationBlock:
    ///         The block to execute which will configure the view.
    ///
    /// - Returns:
    ///     The configured view.
    ///
    @discardableResult
    static func configure(
        _ view: @autoclosure () -> View = .init(frame: .zero),
        configurationBlock: (View) throws -> Void
    ) rethrows -> View {
        let view = view()
        view.translatesAutoresizingMaskIntoConstraints = false
        try configurationBlock(view)
        return view
    }

}
