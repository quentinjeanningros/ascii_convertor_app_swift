//
//  ViewController.swift
//  ascii_convertor_app_swift
//
//  Created by Quentin Jeanningros on 10/03/2021.
//

import UIKit

class ViewController: UIViewController {

    var value : String = ""
    var dispValue : String = ""
    
    @IBOutlet weak var textTuto: UILabel!
    @IBOutlet weak var textOutput: UILabel!
    @IBOutlet weak var textInput: UITextField!
    
    func anim()
    {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
                self.textTuto.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            },
            completion: { _ in
                UIView.animate(withDuration: 0.15, delay: 0.0, options: .curveEaseIn) {
                    self.textTuto.transform = CGAffineTransform.identity
                }
            })
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        if textInput.isEditing
        {
            anim()
            textTuto.text = "Copied 👌"
            UIPasteboard.general.string = value
        }
        else
        {
            anim()
            textTuto.text = "Tap to copy"
            textInput.becomeFirstResponder()
        }
    }
    
    @IBAction func onInpute(_ sender: UITextField) {
        guard let text = sender.text else { return }
        textTuto.text = "Tap to copy"
        value = ""
        dispValue = ""
        for (index, elem) in text.enumerated()
        {
            guard elem.isASCII, let c = elem.asciiValue else { continue }
            if index < text.count
            {
                dispValue += " "
            }
            let letter = String(format: "%03d", c)
            value += letter
            dispValue += letter
        }
        if value.count < 1
        {
            value = ""
            dispValue = "Write to start"
        }
        textOutput.text = dispValue
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        anim()
        textTuto.text = "Tap and start to write"
    }
    
}

