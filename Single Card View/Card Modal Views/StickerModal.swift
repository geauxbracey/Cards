//
//  StickerModal.swift
//  Cards
//
//  Created by Kaitlyn Bracey on 10/1/24.
//

import SwiftUI

struct StickerModal: View {
    
    @State private var stickerNames: [String] = []
    @Binding var stickerImage: UIImage?
    //this property holds the selected image
    @Environment(\.dismiss) var dismiss
    //holds dismiss action
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(stickerNames, id: \.self) { sticker in
                    Image(uiImage: image(from: sticker))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .onTapGesture {
                         stickerImage = image(from: sticker)
                         dismiss()
                            // updates the bound sticker image and dismisses modal
                        }
                }
            }
        }
        .onAppear {
            stickerNames = Self.loadStickers()
        }
        //instead of showing one sticker, iterates through sticker names
    }
    
    static func loadStickers() -> [String] {
        var themes: [URL] = []
        var stickerNames: [String] = []
        let fileManager = FileManager.default
        if let resourcePath = Bundle.main.resourcePath,
           let enumerator = fileManager.enumerator(
            at: URL(fileURLWithPath: resourcePath + "/Stickers"),
            includingPropertiesForKeys: nil,
            options: [
                .skipsSubdirectoryDescendants,
                .skipsHiddenFiles
            ]) {
            for case let url as URL in enumerator
            where url.hasDirectoryPath {
                themes.append(url)
            }
        }
        for theme in themes {
            if let files = try?
                fileManager.contentsOfDirectory(atPath: theme.path) {
                for file in files {
                    stickerNames.append(theme.path + "/" + file)
                }
            }
        }
        return stickerNames
    }
    
    func image(from path: String) -> UIImage {
        print("loading:", path)
        return UIImage(named: path)
            ?? UIImage(named: "error-image")
            ?? UIImage()
    }
    //loads a UIImage from a path
    //temporarily prints out path names to check if lazy loading image
    
    let columns = [
     GridItem(.adaptive(minimum: 120), spacing: 10)
    ]
}

#Preview {
    StickerModal(stickerImage: .constant(UIImage()))
}
