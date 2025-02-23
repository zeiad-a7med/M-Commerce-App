







import SwiftUI
import PassKit

struct ApplePayView: UIViewControllerRepresentable {
    @ObservedObject var paymentViewModel: PaymentViewModel

    func makeUIViewController(context: Context) -> ViewController {
        let vc = ViewController()
        vc.paymentViewModel = paymentViewModel
        return vc
    }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        // Update the view controller if needed
    }
}




