//
//  PDFData.swift
//  Avito Test App
//
//  Created by Георгий iMac on 26.01.2021.
//
//
//import Foundation
//import PDFKit
//
//protocol PDFDataProtocol: class {
//    func getPDFImage(icon: UIImage)
//}
//
//class PDFData {
//    let fileName : String = "CloseIconTemplate"
//    var iconImage : UIImage!
//    weak var pdfDelegate: PDFDataProtocol!
//    
//    init(fileName: String, delegate: PDFDataProtocol) {
////        self.fileName = fileName
//        getImageFromPDF()
//        self.pdfDelegate = delegate
//    }
//    
//func getImageFromPDF() {
//    let url = URL(string: "https://github.com/avito-tech/internship/raw/main/icons/"+fileName+".pdf")
//    let document = PDFDocument(url: url!)
//    guard let page = document?.page(at: 0) else { return }
//    
//    let pageRect = page.bounds(for: .mediaBox)
//    
//    let renderer = UIGraphicsImageRenderer(size: pageRect.size)
//    let image = renderer.image { _ in  }
//    print("PDF to Image converted")
//    iconImage = image
//    
//    sendImage()
//}
//    
//    func sendImage() {
//        guard let _ = iconImage else { print("картинка пустая"); return }
//        self.pdfDelegate.getPDFImage(icon: iconImage)
//    }
//}
