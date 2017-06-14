//
//  MSAlertControllerAnimation.swift
//  MSAlertController
//
//  Created by Jacob King on 17/01/2017.
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

@objc public enum MSAlertControllerShowAnimation: Int {
    case none = 0
    case fade = 1
    case slideCentre = 2
}

@objc public enum MSAlertControllerHideAnimation: Int {
    case none = 0
    case fade = 1
    case slideCentre = 2
}
