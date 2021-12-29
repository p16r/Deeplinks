import UIKit

/// A placeholder view controller that shows some text.
class PlaceholderViewController: UIViewController {

    /// The text to show in the view.
    private let text: String

    /// Initialises a placeholder view controller with the provided text.
    ///
    /// - Parameters:
    ///
    ///     - text:
    ///         The text to show in the view of the view controller.
    ///
    init(text: String) {
        self.text = text
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = PlaceholderView(text: text)
    }

}
