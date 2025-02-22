//
//  PaymentViewController.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 20/02/2025.
//

import UIKit
import PassKit

class ViewController: UIViewController {
    let paymentHandler = PaymentHandler()
    var applePayButton: UIButton?
    var paymentViewModel : PaymentViewModel? 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupApplePayButton()
    }

    func setupApplePayButton() {
        let result = PaymentHandler.applePayStatus()

        if result.canMakePayments {
            applePayButton = PKPaymentButton(paymentButtonType: .checkout, paymentButtonStyle: .black)
            applePayButton?.addTarget(self, action: #selector(payPressed), for: .touchUpInside)
        } else if result.canSetupCards {
            applePayButton = PKPaymentButton(paymentButtonType: .setUp, paymentButtonStyle: .black)
            applePayButton?.addTarget(self, action: #selector(setupPressed), for: .touchUpInside)
        }
      
        applePayButton?.layer.cornerRadius = 30
        
        /*applePayButton?.transform = CGAffineTransform(scaleX: 1.4, y: 1) */ // Makes button 2x larger
        if let applePayButton = applePayButton {
            applePayButton.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(applePayButton)

            NSLayoutConstraint.activate([
                applePayButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             
                applePayButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                applePayButton.widthAnchor.constraint(equalToConstant: 250),
                applePayButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
        
    }

    @objc func payPressed(sender: AnyObject) {
        paymentHandler.startPayment { success in
            if success {
                self.paymentViewModel?.PageDismiss = true
                print("Payment successful")
            }else{
                self.paymentViewModel?.PageDismiss = false
                print("Payment Failed")
            }
        }
    }

    @objc func setupPressed(sender: AnyObject) {
        let passLibrary = PKPassLibrary()
        passLibrary.openPaymentSetup()
    }
}
   



