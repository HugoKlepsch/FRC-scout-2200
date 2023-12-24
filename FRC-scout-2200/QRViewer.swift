//
//  QRViewer.swift
//  FRC-scout-2200
//
//  Created by Hugo Klepsch on 2023-12-21.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRViewer: View {
    private var qr_text = ""
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    init(_ qr_text: String) {
        self.qr_text = qr_text
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                Text(qr_text)
                    .monospaced()
                Image(uiImage: generateQRCode(from: qr_text))
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                
                
            }
            .navigationTitle("QR Viewer")
        }
    }
    
    // Google this code and you'll find where I took it from
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

#Preview {
    QRViewer("sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text ")
}
