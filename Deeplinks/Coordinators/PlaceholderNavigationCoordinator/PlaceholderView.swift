import UIKit

/// A placeholder view that shows some provided text.
final class PlaceholderView: UIView {

    /// Initialises a placeholder view with the provided text.
    ///
    /// - Parameters:
    ///
    ///     - text:
    ///         The text to show in the view.
    ///
    init(text: String) {
        super.init(frame: .zero)
        self.backgroundColor = .systemBackground
        let label = WithAutolayout<UILabel>.configure {
            $0.text = text
            $0.textColor = .label
            $0.textAlignment = .center
            $0.font = .preferredFont(forTextStyle: .body)
            $0.numberOfLines = 0
            $0.adjustsFontForContentSizeCategory = true
        }
        addSubview(label)
        let constraints = [
            label.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 1),
            readableContentGuide.trailingAnchor.constraint(greaterThanOrEqualTo: label.trailingAnchor),
            safeAreaLayoutGuide.bottomAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: label.bottomAnchor, multiplier: 1),
            label.leadingAnchor.constraint(greaterThanOrEqualTo: readableContentGuide.leadingAnchor),
            label.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
