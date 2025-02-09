//
//  CustomNetworkImageView.swift
//  M-Commerce
//
//  Created by Zeiad on 09/02/2025.
//
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage?

    private var cancellable: AnyCancellable?

    func load(from url: URL) {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }

    deinit {
        cancellable?.cancel()
    }
}

struct CustomNetworkImageView: View {
    @StateObject private var loader = ImageLoader()
    let url: URL

    var body: some View {
        Group {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    
            } else {
                ProgressView() // Loading indicator
            }
        }
        .onAppear {
            loader.load(from: url)
        }
    }
}
