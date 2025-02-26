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
    private static var imageCache = NSCache<NSURL, UIImage>()

    func load(from url: URL) {
        // Check cache first
        if let cachedImage = Self.imageCache.object(forKey: url as NSURL) {
            DispatchQueue.main.async {
                self.image = cachedImage
            }
            return
        }

        // Download only if not cached
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] image in
                guard let self = self, let image = image else { return }
                Self.imageCache.setObject(image, forKey: url as NSURL) // Cache the image
                self.image = image
            }
    }

    deinit {
        cancellable?.cancel()
    }
}

struct CustomNetworkImageView: View {
    
    let url: URL
    @StateObject private var loader = ImageLoader()
    
    var body: some View {
        
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    
            } else {
                ShimmerView(width: 150, height: 150)
                    .onAppear {
                        if loader.image == nil { // Load image only if not already loaded
                            loader.load(from: url)
                        }
                    }
            }
    }
}
