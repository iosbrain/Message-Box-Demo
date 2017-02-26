//
//  ViewController.swift
//  Message Box Demo
//
//  Created by Andrew Jaffee on 2/25/17.
/*
 
 Copyright (c) 2017 Andrew L. Jaffee, microIT Infrastructure, LLC, and
 iosbrain.com.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 
*/

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var outputConsole: UITextField!
    
    var messageBoxDismiss:IBMessageBoxDismiss?
    
    var messageBoxDismissAndOK:IBMessageBoxDismissAndOK?
            
    var onOKTapAction:((UIAlertAction) -> Void)?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        messageBoxDismiss = IBMessageBoxDismiss(parentViewController: self)
        
        onOKTapAction =
        { _ in
            print("Message box OK tapped")
            self.outputConsole.text = "Message box OK tapped"
        }
        
        messageBoxDismissAndOK = IBMessageBoxDismissAndOK(parentViewController: self,
                                                          completionClosure: onOKTapAction!,
                                                          makesChanges: false)
        messageBoxDismissAndOK?.makeRightmostButtonPreferred()
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showMessageBoxWithNoDefaultText(_ sender: Any)
    {
        if let success = messageBoxDismiss?.display()
        {
            print("IBMessageBoxDismiss shown (true/false)? - \(success)")
            outputConsole.text = "IBMessageBoxDismiss shown (true/false)? - \(success)"
            _ = messageBoxDismiss?.getTitle()
        }
    }
    
    @IBAction func showMsgBoxWithParams(_ sender: Any)
    {
        if let success = messageBoxDismiss?.display(title: "Title", message: "A description")
        {
            print("IBMessageBoxDismiss shown (true/false)? - \(success)")
            outputConsole.text = "IBMessageBoxDismiss shown (true/false)? - \(success)"
            _ = messageBoxDismiss?.getTitle()
        }
    }
    
    @IBAction func showMsgBoxWithNewText(_ sender: Any)
    {
        if let success = messageBoxDismiss?.display(title: "2nd Title", message: "A 2nd description")
        {
            print("IBMessageBoxDismiss shown (true/false)? - \(success)")
            outputConsole.text = "IBMessageBoxDismiss shown (true/false)? - \(success)"
            _ = messageBoxDismiss?.getTitle()
        }
    }
   
    @IBAction func showDismissOKMsgBoxWNoDefaultText(_ sender: Any)
    {
        if let success = messageBoxDismissAndOK?.display()
        {
            print("IBMessageBoxDismissAndOK shown (true/false)? - \(success)")
            outputConsole.text = "IBMessageBoxDismissAndOK shown (true/false)? - \(success)"
            _ = messageBoxDismissAndOK?.getTitle()
        }
    }
    
    @IBAction func showDisOkMsgBoxWithParams(_ sender: Any)
    {
        if let success = messageBoxDismissAndOK?.display(title: "Title", message: "A description")
        {
            print("IBMessageBoxDismissAndOK shown (true/false)? - \(success)")
            outputConsole.text = "IBMessageBoxDismissAndOK shown (true/false)? - \(success)"
            _ = messageBoxDismissAndOK?.getTitle()
        }
    }
    
    @IBAction func showDisOkMsgBoxWithNewText(_ sender: Any)
    {
        if let success = messageBoxDismissAndOK?.display(title: "2nd Title", message: "A 2nd description")
        {
            print("IBMessageBoxDismissAndOK shown (true/false)? - \(success)")
            outputConsole.text = "IBMessageBoxDismissAndOK shown (true/false)? - \(success)"
            _ = messageBoxDismissAndOK?.getTitle()
        }
    }
    
    @IBAction func showStackDismissOKMsgBox(_ sender: Any)
    {
        let onOKTapAction:((UIAlertAction) -> Void)? =
        { _ in
            print("Local IBMessageBoxDismissAndOK OK tapped")
            self.outputConsole.text = "Local IBMessageBoxDismissAndOK OK tapped"
        }
        
        let msgBoxDismissOKOnStack = IBMessageBoxDismissAndOK(parentViewController: self, title: "Local Message Box", message: "Created on Stack", completionClosure: onOKTapAction!, makesChanges: true)
        
        _ = msgBoxDismissOKOnStack.display()
        
        _ = msgBoxDismissOKOnStack.getTitle()
    }
    
    func reportMessageBoxText() -> Void
    {
        print("IBMessageBoxDismissAndOKWithTextField text: \((capturedTextField?.text)!)")
        outputConsole.text = "IBMessageBoxDismissAndOKWithTextField text: \((capturedTextField?.text)!)"
    }
    
    @IBAction func showStackDismissOKTextFieldMsgBox(_ sender: Any)
    {
        let onOKTapAction:((UIAlertAction) -> Void)? =
        { _ in
            self.reportMessageBoxText()
        }

        let msgBoxDismissOKTextOnStack = IBMessageBoxDismissAndOKWithTextField(parentViewController: self, title: "Username", message: "Please enter username:", completionClosure: onOKTapAction!, makesChanges: true)

        _ = msgBoxDismissOKTextOnStack.display()
        
        _ = msgBoxDismissOKTextOnStack.getTitle()
    }
    
}

