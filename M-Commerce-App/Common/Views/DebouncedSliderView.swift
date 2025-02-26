import SwiftUI
import Combine

struct DebouncedSliderView: View {
    @Binding var sliderValue: Double
    @State private var debouncedValue: Double = 50
    private let debouncePublisher = PassthroughSubject<Double, Never>()
    @State private var cancellable: AnyCancellable?
    let maxNumber = (1000 * (CurrencyManager.currentCurrencyRate.value ?? 1.0))
    var body: some View {
        VStack {
            ZStack {
                Slider(value: $sliderValue, in: 0...maxNumber, step: 1)
                    .tint(sliderValue == maxNumber ? .red : ThemeManager.darkPuble)
                    .padding()
                    .onChange(of: sliderValue) { newValue in
                        debouncePublisher.send(newValue)
                    }

                Text("\(CurrencyManager.currentCurrencyRate.code ?? "EGP")\(Int(sliderValue))")
                    .offset(x: CGFloat(sliderValue / 10) - 10, y: -10) // Adjust position
                    .font(.caption)
                    .foregroundColor(ThemeManager.darkPuble)
            }
        }
        .onAppear {
                    cancellable = debouncePublisher
                .debounce(for: .seconds(1), scheduler: DispatchQueue.global(qos: .background))
                        .sink { value in
                            debouncedValue = value
                            sliderValue = value
                        }
                }
                .onDisappear {
                    cancellable?.cancel()
                }
    }
}

struct DebouncedSliderView_Previews: PreviewProvider {
    static var previews: some View {
        DebouncedSliderView(sliderValue: .constant(12.0))
    }
}
