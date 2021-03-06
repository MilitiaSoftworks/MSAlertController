//
//  KeyboardEventHelper.swift
//  MSAlertController
//
//  Created by Jacob King on 04/04/2017.
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

import Foundation
import UIKit

internal protocol KeyboardListener {
    func keyboardWillShow(_ notification: Notification)
    func keyboardDidShow(_ notification: Notification)
    func keyboardWillHide(_ notification: Notification)
    func keyboardDidHide(_ notification: Notification)
    
    func subscribeToKeyboardEvents() throws
    func unsubscribeFromKeyboardEvents() throws
}

internal extension KeyboardListener {
    func keyboardWillShow(_ notification: Notification) { }
    func keyboardDidShow(_ notification: Notification) { }
    func keyboardWillHide(_ notification: Notification) { }
    func keyboardDidHide(_ notification: Notification) { }
    
    func subscribeToKeyboardEvents() throws {
        if let object = self as? AnyObject {
            if object.responds(to: "keyboardWillShow:") {
                NotificationCenter.default.addObserver(object, selector: "keyboardWillShow:", name: NSNotification.Name.UIKeyboardWillShow, object: nil)
            }
            if object.responds(to: "keyboardDidShow:") {
                NotificationCenter.default.addObserver(object, selector: "keyboardDidShow:", name: NSNotification.Name.UIKeyboardDidShow, object: nil)
            }
            if object.responds(to: "keyboardWillHide:") {
                NotificationCenter.default.addObserver(object, selector: "keyboardWillHide:", name: NSNotification.Name.UIKeyboardWillHide, object: nil)
            }
            if object.responds(to: "keyboardDidHide:") {
                NotificationCenter.default.addObserver(object, selector: "keyboardDidHide:", name: NSNotification.Name.UIKeyboardDidHide, object: nil)
            }
            return
        }
        throw KeyboardHelperError.invalidConformanceToAnyObject
    }
    
    func unsubscribeFromKeyboardEvents() throws {
        if let object = self as? AnyObject {
            NotificationCenter.default.removeObserver(object, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
            NotificationCenter.default.removeObserver(object, name: NSNotification.Name.UIKeyboardDidShow, object: nil)
            NotificationCenter.default.removeObserver(object, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
            NotificationCenter.default.removeObserver(object, name: NSNotification.Name.UIKeyboardDidHide, object: nil)
            return
        }
        throw KeyboardHelperError.invalidConformanceToAnyObject
    }
}

internal enum KeyboardHelperError: Error {
    case invalidConformanceToAnyObject
}
