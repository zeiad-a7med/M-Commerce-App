import SwiftUI
import PassKit

struct PaymentButtonView: View {
    var body: some View {
        VStack {
            ApplePayButtonView()
                .padding()
                .onTapGesture {
                    // Handle button tap action (you can trigger your payment flow here)
                    initiatePayment()
                }
        }
    }
    
    func initiatePayment() {
        // Here, we will just print a message for the demonstration.
        // In a real app, you will start the payment process.
        print("Apple Pay button tapped")
    }
}
struct ApplePayButtonView: View {
    var body: some View {
        ApplePayButton()
            .frame(height: 50) // Adjust the height of the button
    }
}

struct ApplePayButton: UIViewRepresentable {
    
    // Create the PKPaymentButton with specific type and style
    func makeUIView(context: Context) -> PKPaymentButton {
        let paymentButton = PKPaymentButton(paymentButtonType: .buy, paymentButtonStyle: .black)
        
        // Add target action to handle the tap
        paymentButton.addTarget(context.coordinator, action: #selector(Coordinator.applePayButtonTapped), for: .touchUpInside)
        
        return paymentButton
    }
    
    func updateUIView(_ uiView: PKPaymentButton, context: Context) {
        // Here we can update the button if needed
    }
    
    // Create a Coordinator to handle actions for the button
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    class Coordinator: NSObject {
        
        // Handle Apple Pay button tap
        @objc func applePayButtonTapped() {
            print("Apple Pay button tapped")
            // Trigger your payment flow or payment request here.
        }
    }
}

#Preview{
    PaymentButtonView()
}
