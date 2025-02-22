////
////  PaymentViewController.swift
////  M-Commerce-App
////
////  Created by Andrew Emad on 20/02/2025.
////
//
//import UIKit
//import PassKit
//
//class ViewController: UIViewController {
//    let paymentHandler = PaymentHandler()
//    var applePayButton: UIButton?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupApplePayButton()
//    }
//
//    func setupApplePayButton() {
//        let result = PaymentHandler.applePayStatus()
//
//        if result.canMakePayments {
//            applePayButton = PKPaymentButton(paymentButtonType: .checkout, paymentButtonStyle: .black)
//            applePayButton?.addTarget(self, action: #selector(payPressed), for: .touchUpInside)
//        } else if result.canSetupCards {
//            applePayButton = PKPaymentButton(paymentButtonType: .setUp, paymentButtonStyle: .black)
//            applePayButton?.addTarget(self, action: #selector(setupPressed), for: .touchUpInside)
//        }
//        applePayButton?.frame = CGRect(x:150,y:200,width: 300, height: 75)
//        applePayButton?.layer.cornerRadius = 15
//        if let applePayButton = applePayButton {
//            applePayButton.translatesAutoresizingMaskIntoConstraints = false
//            view.addSubview(applePayButton)
//
//            NSLayoutConstraint.activate([
//                applePayButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                applePayButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//            ])
//        }
//        
//    }
//
//    @objc func payPressed(sender: AnyObject) {
//        paymentHandler.startPayment { success in
//            if success {
//                // Handle successful payment
//                print("Payment successful")
//            }
//        }
//    }
//
//    @objc func setupPressed(sender: AnyObject) {
//        let passLibrary = PKPassLibrary()
//        passLibrary.openPaymentSetup()
//    }
//}
//   
//
//
//
