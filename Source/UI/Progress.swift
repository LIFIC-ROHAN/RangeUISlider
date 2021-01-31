//
//  ProgressView.swift
//  RangeUISlider
//
//  Created by Fabrizio Duroni on 29/09/2017.
//  2017 Fabrizio Duroni.
//

import Foundation
import UIKit

class Progress: Gradient {
    func setup(leftAnchorView: UIView,
               leftAnchorConstraintAttribute: NSLayoutConstraint.Attribute,
               rightAnchorView: UIView,
               rightAnchorConstraintAttribute: NSLayoutConstraint.Attribute,
               color: UIColor
    ) -> [NSLayoutConstraint] {
        accessibilityIdentifier = "Progress"
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = color
        let views = ConstraintViews(target: self, related: superview)
        return [
            DimensionConstraintFactory.equalHeight(views: views),
            PositionConstraintFactory.centerY(views: views),
            MarginConstraintFactory.leadingTo(
                attribute: leftAnchorConstraintAttribute,
                views: ConstraintViews(target: self, related: leftAnchorView),
                value: 0.0
            ),
            MarginConstraintFactory.trailingTo(
                attribute: rightAnchorConstraintAttribute,
                views: ConstraintViews(target: self, related: rightAnchorView),
                value: 0.0
            )
        ]
    }

    func addBackground(image: UIImage, edgeInset: UIEdgeInsets, corners: CGFloat) {
        let backgroundImageView = createBackgroundUsing(image: image, edgeInset: edgeInset, corners: corners)
        addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            MarginConstraintFactory.leading(
                views: ConstraintViews(target: backgroundImageView, related: self),
                value: 0.0
            ),
            MarginConstraintFactory.trailing(
                views: ConstraintViews(target: backgroundImageView, related: self),
                value: 0.0
            ),
            MarginConstraintFactory.top(
                views: ConstraintViews(target: backgroundImageView, related: self),
                value: 0.0
            ),
            MarginConstraintFactory.bottom(
                views: ConstraintViews(target: backgroundImageView, related: self),
                value: 0.0
            )
        ])
    }

    private func createBackgroundUsing(image: UIImage, edgeInset: UIEdgeInsets, corners: CGFloat) -> UIView {
        let backgroundResizableImage = image.resizableImage(withCapInsets: edgeInset)
        let backgroundImageView = UIImageView(image: backgroundResizableImage)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.layer.masksToBounds = corners > 0
        backgroundImageView.layer.cornerRadius = corners
        backgroundImageView.accessibilityIdentifier = "ProgressBackground"
        return backgroundImageView
    }
}
