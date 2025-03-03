/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A shared class for handling payments across an app and its related extensions.
*/

import PassKit
import UIKit

typealias PaymentCompletionHandler = (Bool) -> Void

class PaymentHandler: NSObject {

    var paymentController: PKPaymentAuthorizationController?
    var paymentSummaryItems = [PKPaymentSummaryItem]()
    var paymentStatus = PKPaymentAuthorizationStatus.failure
    var completionHandler: PaymentCompletionHandler!

    static let supportedNetworks: [PKPaymentNetwork] = [
        .amex,
        .discover,
        .masterCard,
        .visa,
    ]

    class func applePayStatus() -> (canMakePayments: Bool, canSetupCards: Bool)
    {
        return (
            PKPaymentAuthorizationController.canMakePayments(),
            PKPaymentAuthorizationController.canMakePayments(
                usingNetworks: supportedNetworks)
        )
    }

    //    // Define the shipping methods.
    //    func shippingMethodCalculator() -> [PKShippingMethod] {
    //        // Calculate the pickup date.
    //
    //        let today = Date()
    //        let calendar = Calendar.current
    //
    //        let shippingStart = calendar.date(byAdding: .day, value: 3, to: today)!
    //        let shippingEnd = calendar.date(byAdding: .day, value: 5, to: today)!
    //
    //        let startComponents = calendar.dateComponents([.calendar, .year, .month, .day], from: shippingStart)
    //        let endComponents = calendar.dateComponents([.calendar, .year, .month, .day], from: shippingEnd)
    //
    //        let shippingDelivery = PKShippingMethod(label: "Delivery", amount: NSDecimalNumber(string: "0.00"))
    //        shippingDelivery.dateComponentsRange = PKDateComponentsRange(start: startComponents, end: endComponents)
    //        shippingDelivery.detail = "Ticket sent to you address"
    //        shippingDelivery.identifier = "DELIVERY"
    //
    //        let shippingCollection = PKShippingMethod(label: "Collection", amount: NSDecimalNumber(string: "0.00"))
    //        shippingCollection.detail = "Collect ticket at festival"
    //        shippingCollection.identifier = "COLLECTION"
    //
    //        return [shippingDelivery, shippingCollection]
    //    }

    func startPayment(completion: @escaping PaymentCompletionHandler) {

        completionHandler = completion
        let rate : Double = CurrencyManager.currentCurrencyRate.value ?? 1.0
        AuthManager.shared.applicationUser?.cart?.lines?.forEach({ line in
            
            let lineTotal =  Double(
                (line.lineCost?.totalAmount?.amount ?? "0")) ?? 0
            
            let ticket = PKPaymentSummaryItem(
                label: line.variant?.productTitle ?? "",
                amount: NSDecimalNumber(
                    string: String(format:"%.2f",Double(lineTotal * rate))),
                type: .final)
            paymentSummaryItems.append(ticket)
        })

        
        
        let total =
            Double(
                (AuthManager.shared.applicationUser?.cart?.cost?
                    .totalAmount?.amount ?? "0")) ?? 0
        
        
        var discount : Double = 0
        var couponCode = AuthManager.shared.applicationUser?.couponCode
        if(couponCode != nil){
            for item in Constants.coupons {
                if item.code == couponCode {
                    if item.type == .percentage {
                        discount = (Double(total)) * ((item.value) / 100)
                    } else {
                        discount = (Double(total)) - (item.value)
                    }
                    break
                }
            }
        }
        
        let ticket2 = PKPaymentSummaryItem(
            label: "Discount",
            amount: NSDecimalNumber(
                string: String(format:"%.2f",discount)
            ), type: .final
        )
        paymentSummaryItems.append(ticket2)
        

        let ticket3 = PKPaymentSummaryItem(
            label: "Total",
            amount: NSDecimalNumber(
                string: String(format:"%.2f",Double(total * rate) - discount)
            ), type: .final
        )
        paymentSummaryItems.append(ticket3)
        
        
        
        
        
        

        // Create a payment request.
        let paymentRequest = PKPaymentRequest()
        paymentRequest.paymentSummaryItems = paymentSummaryItems
        paymentRequest.merchantIdentifier = Configuration.Merchant.identifier
        paymentRequest.merchantCapabilities = .threeDSecure
        paymentRequest.countryCode = Constants.countries.first { co in
            (co.currencyCode == CurrencyManager.currentCurrencyRate.code ?? "EGP")
        }?.currencyKey ?? "EG"
        paymentRequest.currencyCode = CurrencyManager.currentCurrencyRate.code ?? "EGP"
        paymentRequest.supportedNetworks = PaymentHandler.supportedNetworks
        //        paymentRequest.shippingType = .delivery
        //        paymentRequest.shippingMethods = shippingMethodCalculator()
        //        paymentRequest.requiredShippingContactFields = [.name, .postalAddress]

        // Display the payment request.
        paymentController = PKPaymentAuthorizationController(
            paymentRequest: paymentRequest)
        paymentController?.delegate = self
        paymentController?.present(completion: { (presented: Bool) in
            if presented {
                debugPrint("Presented payment controller")
            } else {
                debugPrint("Failed to present payment controller")
                self.completionHandler(false)
            }
        })
    }
}

// Set up PKPaymentAuthorizationControllerDelegate conformance.

extension PaymentHandler: PKPaymentAuthorizationControllerDelegate {

    func paymentAuthorizationController(
        _ controller: PKPaymentAuthorizationController,
        didAuthorizePayment payment: PKPayment,
        handler completion: @escaping (PKPaymentAuthorizationResult) -> Void
    ) {

        // Perform basic validation on the provided contact information.
        var errors = [Error]()
        var status = PKPaymentAuthorizationStatus.success
        //        if payment.shippingContact?.postalAddress?.isoCountryCode != "US" {
        //            let pickupError = PKPaymentRequest.paymentShippingAddressUnserviceableError(withLocalizedDescription: "Sample App only available in the United States")
        //            let countryError = PKPaymentRequest.paymentShippingAddressInvalidError(withKey: CNPostalAddressCountryKey, localizedDescription: "Invalid country")
        //            errors.append(pickupError)
        //            errors.append(countryError)
        //            status = .failure
        //        } else {
        //            // Send the payment token to your server or payment provider to process here.
        //            // Once processed, return an appropriate status in the completion handler (success, failure, and so on).
        //        }

        self.paymentStatus = status
        completion(PKPaymentAuthorizationResult(status: status, errors: errors))
    }

    func paymentAuthorizationControllerDidFinish(
        _ controller: PKPaymentAuthorizationController
    ) {
        controller.dismiss {
            // The payment sheet doesn't automatically dismiss once it has finished. Dismiss the payment sheet.
            DispatchQueue.main.async {
                if self.paymentStatus == .success {
                    self.completionHandler!(true)
                } else {
                    self.completionHandler!(false)
                }
            }
        }
    }

}
