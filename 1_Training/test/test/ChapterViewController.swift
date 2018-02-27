//
//  ChapterViewController.swift
//  test
//
//  Created by Alan Dewo on 2/4/18.
//  Copyright © 2018 onedevz. All rights reserved.
//

import UIKit
import TesseractOCR

class ChapterViewController: UIViewController, G8TesseractDelegate {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tesseract = G8Tesseract(language: "eng")
        {
            tesseract.delegate = self
            tesseract.image = UIImage(named: "text2")?.g8_blackAndWhite()
            tesseract.recognize()
            
            textView.text = tesseract.recognizedText
        }

    }

    func progressImageRecognition(for tesseract: G8Tesseract!) {
        print("Recognition progress\(tesseract.progress) %")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
