//
//  AsyncImage.swift
//  CarfaxList
//
//  Created by Khatib Mahad H. on 7/30/21.
//

import SwiftUI

struct AsyncImage<Placeholder: View>: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: Placeholder
    private let image: (UIImage) -> Image
    
    init(
        url: URL,
        @ViewBuilder placeholder: () -> Placeholder,
        @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:)
    ) {
        self.placeholder = placeholder()
        self.image = image
        _loader = StateObject(wrappedValue: ImageLoader(url: url, cache: Environment(\.imageCache).wrappedValue))
    }
    
    var body: some View {
        content
            .onAppear(perform: loader.load)
    }
    
    private var content: some View {
        Group {
            if let downloaded = loader.image {
                if downloaded.size.width > 10 && downloaded.size.height > 10 {
                    image(downloaded)
                        .aspectRatio(contentMode: .fit)
                }
                else {
                    Text("No photo")
                        .background(Color.gray)
                        .padding()
                }
            } else {
                placeholder
            }
        }
    }
}

