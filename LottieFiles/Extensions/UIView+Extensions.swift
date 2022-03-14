//
//  UIView+Extensions.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 14/03/2022.
//

import UIKit

extension UIView {
    
    /// Adds views to the end of the receiver’s list of subviews
    ///
    /// Usage:
    ///
    ///     views.addSubviews([view1, view2])
    ///
    /// - Parameter subviews: Array of subviews to be added
    ///
    func addSubviews(_ subviews: [UIView]) {
        for view in subviews {
            self.addSubview(view)
        }
    }
}
