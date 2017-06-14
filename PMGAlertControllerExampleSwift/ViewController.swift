//
//  ViewController.swift
//  PMGAlertControllerExampleSwift
//
//  Created by Jacob King on 13/01/2017.
//  Copyright © 2017 Parkmobile Group. All rights reserved.
//

import UIKit
import PMGAlertController

class ViewController: UIViewController {
    
    // DEMO of most basic alert view, using pre-built convenience method and no animation.
    @IBAction func demo1(_ sender: Any) {
        
        let alert = PMGAlertController.basicOneButton(title: "Error", body: "The server cannot be reached, please try again later.", buttonTitle: "Okay") { (sender, alert) in
            print("Dismissing")
            // Executed when button is pressed.
            
        }
        
        alert.showAlert(withAnimation: .none)
    }
    
    // DEMO of text input alert view, with 2 buttons and a fade animation. Uses convenience builder.
    @IBAction func demo2(_ sender: Any) {
        
        let alert = PMGAlertController.basicTextInput(title: "Reset my password", body: "Enter the mobile number or email address you used when creating our account. Then hit the send button and we will send you a text or email with instructions on how to reset your password.", textfieldPlaceholder: "Mobile or email", buttonOneTitle: "Send",
                                                buttonOneAction: { (sender, alert) in
                                                    
                                                    alert.dismissAlert(withAnimation: .fade)
                                                    // Executed when button is pressed.
                                                    
        }, buttonTwoTitle: "Cancel") { (sender, alert) in
            print("Dismissing")
            // Executed when button is pressed.
            
        }
        
        alert.showAlert(withAnimation: .fade)
    }
    
    // DEMO of totally custom built alert view with no convenience builder.
    @IBAction func demo3(_ sender: Any) {
        
        let alert = PMGAlertController.empty()
        
        let title = PMGAlertControllerTitleComponent.withTitleText("ParkNow sticker required")
        
        let body = PMGAlertControllerBodyComponent.withBodyText("This on-street location requires a parking sitcker to be displayed in the windscreen of your vehicle.\n\nDon’t have a parking sticker yet? You can download the parking sticker for free on park-now.com or order one below. Alternatively, you can place a note with ‘ParkNow Handyparken’ behind your windscreen.")
        
        let box = PMGAlertControllerCheckboxComponent.withText("Don't remind me", defaultStateIsTicked: false) { (button, ticket) in
            // Executed when checkbox is toggled.
        }
        
        let button1 = PMGAlertControllerButtonComponent.submissiveButtonWithText("Start parking") { (sender) in
            alert.dismissAlert(withAnimation: .slideCentre)
            // Executed when button is pressed.
        }
        
        let button2 = PMGAlertControllerButtonComponent.standardButtonWithText("Order a sticker") { (sender) in
            alert.dismissAlert(withAnimation: .slideCentre)
            // Executed when button is pressed.
        }
        
        let button3 = PMGAlertControllerButtonComponent.standardButtonWithText("Cancel") { (sender) in
            alert.dismissAlert(withAnimation: .slideCentre)
            // Executed when button is pressed.
        }
        
        // As this is custom, apply custom spacing to components.
        title.applyConstraintMap(PMGAlertControllerConstraintMap(top: 16, bottom: 8, left: 16, right: 16))
        body.applyConstraintMap(PMGAlertControllerConstraintMap(top: 8, bottom: 8, left: 16, right: 16))
        box.applyConstraintMap(PMGAlertControllerConstraintMap(top: 8, bottom: 16, left: 16, right: 16, height: 20))
        
        alert.components = [title, body, box, button1, button2, button3]
        alert.showAlert(withAnimation: .slideCentre)
    }
}

