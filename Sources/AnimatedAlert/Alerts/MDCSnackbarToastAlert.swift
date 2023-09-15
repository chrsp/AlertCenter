//
//  MDCSnackbarToastAlert.swift
//
//
//  Created by Charles Prado on 15/09/2023.
//

import UIKit

public class MDCSnackbarToastAlert: UIView, AnimatedAlert {

    private let textLabel: UILabel = .init()
    private let actionButton: UIButton = .init(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor(hex: "#343434")

        layer.cornerRadius = 8
        layer.masksToBounds = true

        textLabel.numberOfLines = 0
        textLabel.adjustsFontSizeToFitWidth = true
        textLabel.minimumScaleFactor = 0.5
        textLabel.textColor = .white
        textLabel.font = UIFont.preferredFont(forTextStyle: .body)

        let stackView = UIStackView(arrangedSubviews: [textLabel, actionButton])
        stackView.axis = .horizontal
        stackView.alignment = .center

        addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false

        actionButton.setContentHuggingPriority(.required, for: .horizontal)
        actionButton.setContentCompressionResistancePriority(.required, for: .horizontal)
        actionButton.tintColor = .white.withAlphaComponent(0.6)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
        ])

        stackView.layoutIfNeeded()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(text: String, action: ToastAction?) {
        textLabel.text = text

        if let action = action {
            actionButton.setTitle(action.title.uppercased(), for: .normal)
            actionButton.addAction(action.action, for: .touchUpInside)
            actionButton.isHidden = false
        } else {
            actionButton.isHidden = true
        }
    }
}
