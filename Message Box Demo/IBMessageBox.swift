//
//  IBMessageBox.swift
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

class IBMessageBoxDismiss
{
    fileprivate var messageBox:UIAlertController
    fileprivate var parentViewController:UIViewController
    
    init(parentViewController:UIViewController)
    {
        
        // an alert can only be shown in a view controller
        self.parentViewController = parentViewController
        
        // .alert is a traditional Apple mobile alert/message box
        self.messageBox = UIAlertController(title: "", message: "", preferredStyle: .alert)
        
        self.messageBox.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        
    } // end init(parentViewController:UIViewController)
    
    convenience init(parentViewController:UIViewController, title:String, message:String)
    {
        
        self.init(parentViewController: parentViewController)
        
        messageBox.title = title
        
        messageBox.message = message
        
    } // end init(parentViewController:UIViewController, title:String, message:String)
    
    func display() -> Bool
    {
        
        if messageBox.message != "" && messageBox.title != ""
        {
            parentViewController.present(messageBox, animated: true, completion: nil)
            
            return true
        }
        else
        {
            return false
        }
        
    } // end display()

    func display(title:String, message:String) -> Bool
    {
        
        if message != "" && title != ""
        {
            messageBox.message = message
            
            messageBox.title = title
            
            parentViewController.present(messageBox, animated: true, completion: nil)
            
            return true
        }
        else
        {
            return false
        }
        
    } // end display(title:String, message:String) -> Bool
    
    func getTitle() -> String
    {
        if let title = messageBox.title
        {
            print("IBMessageBoxDismiss: \(title)")
            return title
        }
        else
        {
            return ""
        }
    }
    
    func makeRightmostButtonPreferred() -> Void
    {
        let lastActionIndex = messageBox.actions.count - 1
        messageBox.preferredAction = messageBox.actions[lastActionIndex]
    }

} // end class IBMessageBoxDismiss

class IBMessageBoxDismissAndOK : IBMessageBoxDismiss
{
    
    fileprivate var onOKTapAction:(UIAlertAction) -> Void
    
    init(parentViewController: UIViewController, completionClosure: @escaping (UIAlertAction) -> Void, makesChanges:Bool)
    {
        onOKTapAction = completionClosure
        
        // BE CAREFUL TO INITIALIZE THIS CLASS'S MEMBER PROPERTIES <<<BEFORE>>>
        // CALLING super.init; otherwise you'll get error "IBMessageBox.swift:... Property 'self.onOKTapAction'
        // not initialized at super.init call"
        super.init(parentViewController: parentViewController)
        
        if makesChanges
        {
            self.messageBox.addAction(UIAlertAction(title: "OK", style: .destructive, handler: completionClosure))
            
            makeRightmostButtonPreferred()
        }
        else
        {
            self.messageBox.addAction(UIAlertAction(title: "OK", style: .default, handler: completionClosure))
        }

    } // end init
    
    convenience init(parentViewController:UIViewController,
                                    title:String,
                                  message:String,
                        completionClosure:@escaping (UIAlertAction) -> Void,
                             makesChanges:Bool)
    {
        
        self.init(parentViewController: parentViewController, completionClosure:completionClosure, makesChanges:makesChanges)
        
        messageBox.title = title
        
        messageBox.message = message
        
    } // end convenience init
    
    override func getTitle() -> String
    {
        let title = super.getTitle()
        print("IBMessageBoxDismiss: \(title)")
        return title
    }
    
    //
    // Notice that method
    //
    // func display() -> Bool
    //
    // is not defined here, but is inherited from parent
    //

    //
    // Notice that method
    //
    // func display(title:String, message:String) -> Bool
    //
    // is not defined here, but is inherited from parent
    //
    
} // end class IBMessageBoxDismissAndOK

// this is my hackish, quick way of accessing the text typed into
// the message box's textfield
var capturedTextField:UITextField?

class IBMessageBoxDismissAndOKWithTextField : IBMessageBoxDismissAndOK
{
    
    init(parentViewController:UIViewController,
         title:String,
         message:String,
         completionClosure:@escaping (UIAlertAction) -> Void,
         makesChanges:Bool)
    {
        
        super.init(parentViewController: parentViewController, completionClosure:completionClosure, makesChanges:makesChanges)

        messageBox.title = title

        messageBox.message = message

        messageBox.addTextField
        {
            (textField) in
                textField.keyboardType = .default
                textField.clearButtonMode = .always
                capturedTextField = self.messageBox.textFields![0]
        }
        
    } // end init
    
    override func getTitle() -> String
    {
        let title = super.getTitle()
        print("IBMessageBoxDismissAndOK: \(title)")
        return title
    }
    
} // end IBMessageBoxDismissAndOKWithTextField
