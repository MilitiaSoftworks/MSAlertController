//
//  UIView+MSAlertController.swift
//  MSAlertController
//
//  Created by Jacob King on 13/01/2017.
//  Copyright © 2017 Militia Softworks Ltd. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import UIKit

internal extension NSLayoutConstraint {
    
    static func pinning(attribute: NSLayoutAttribute, ofView firstView: UIView, toView secondView: UIView, multiplier: CGFloat = 1, offset: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView, attribute: attribute, relatedBy: .equal, toItem: secondView, attribute: attribute, multiplier: 1, constant: 0)
    }
    
    static func pinning(attributes: [NSLayoutAttribute], ofView firstView: UIView, toView secondView: UIView, multiplier: CGFloat = 1, offset: CGFloat = 0) -> [NSLayoutConstraint] {
        return attributes.map { return NSLayoutConstraint(item: firstView, attribute: $0, relatedBy: .equal, toItem: secondView, attribute: $0, multiplier: 1, constant: 0) }
    }
}

internal extension UIView {
    
    /// Pins view to superview on all four sides.
    @discardableResult func pinToSuperview() -> (top: NSLayoutConstraint, left: NSLayoutConstraint, bottom: NSLayoutConstraint, right: NSLayoutConstraint)? {
        guard let parent = self.superview else {
            return nil
        }
        let constraints = NSLayoutConstraint.pinning(attributes: [.top, .left, .bottom, .right], ofView: self, toView: parent)
        parent.addConstraints(constraints)
        parent.layoutIfNeeded()
        return (top: constraints[0], left: constraints[1], bottom: constraints[2], right: constraints[3])
    }
}
