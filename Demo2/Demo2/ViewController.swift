//
//  ViewController.swift
//  Demo2
//
//  Created by Vignesh J on 12/08/21.
//

import UIKit
import PDFReader

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /// Displays a larger sized PDF document
    @IBAction private func showRemotePDFDocument() {
        let remotePDFDocumentURLPath = "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        if let remotePDFDocumentURL = URL(string: remotePDFDocumentURLPath), let doc = document(remotePDFDocumentURL) {
            showDocument(doc)
        } else {
            print("Document named \(remotePDFDocumentURLPath) not found")
        }
    }
    
    /// Initializes a document with the remote url of the pdf
    private func document(_ remoteURL: URL) -> PDFDocument? {
        return PDFDocument(url: remoteURL)
    }
    
    
    /// Presents a document
    ///
    /// - parameter document: document to present
    ///
    /// Add `thumbnailsEnabled:false` to `createNew` to not load the thumbnails in the controller.
    private func showDocument(_ document: PDFDocument) {
        let image = UIImage(named: "")
        let controller = PDFViewController.createNew(with: document, title: "", actionButtonImage: image, actionStyle: .activitySheet)
        navigationController?.pushViewController(controller, animated: true)
    }


}

