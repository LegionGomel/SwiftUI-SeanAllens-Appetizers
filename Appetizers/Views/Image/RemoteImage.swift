//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Yuri Ershov on 7.01.22.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil

    func load(fromURLString urlString: String) {
        // First, download the image
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiimage in
            guard let uiimage = uiimage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiimage)
            }
        }
    }
}
// Second, we have a view when if image is not downloaded, show a placeholder
struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

// Third, this View we will use as our main View with other parts under the hood.
struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(fromURLString: urlString)
            }
    }
}
