# Message Box Demo
I used Swift 3 to create a message box class hierarchy to demonstrate object-oriented principles like classes, inheritance, encapsulation, reusability, and polymorphism. Many iOS developers create UIAlertControllers on an as-needed basis to display alert messages to the user. This can lead to an excessive amount of code, especially in complex and highly interactive apps. Most developers were trained to consolidate code that is needed frequently and in many different states into a class or method/function, but it seems that alerts are often ignored when it comes to writing maintainable code. This may be due to the fact that, according to Apple, ["The UIAlertController class is intended to be used as-is and does not support subclassing. The view hierarchy for this class is private and must not be modified."](https://developer.apple.com/reference/uikit/uialertcontroller). But that certainly doesn't mean you can't encapsulate (or "wrap") a UIAlertController in your own "alert" or "message box" class. I keep the code in this project handy and use it in most of my app work so that displaying an alert, especially one that triggers a complex process, just takes a few lines of code. Remember that you can associate a [block](http://iosbrain.com/blog/2017/02/12/make-blocks-closures-your-friend-objective-c/) with an alert's button (the "handler," which is ["A block to execute when the user selects the action."](https://developer.apple.com/reference/uikit/uialertaction/1620097-init))

(Note that the UIAlertController replaces the UIActionSheet and UIAlertView classes that iOS developers took for granted for years.)

This is an Xcode 8.2.1 project targeting the iOS 10 SDK.

## Xcode 8.2.1 project settings
**To get this project running on the Simulator or a physical device (iPhone, iPad)**, go to the following locations in Xcode and make the suggested changes:

1. Project Navigator -> [Project Name] -> Targets List -> TARGETS -> [Target Name] -> General -> Signing
- [ ] Tick the "Automatically manage signing" box
- [ ] Select a valid name from the "Team" dropdown
  
2. Project Navigator -> [Project Name] -> Targets List -> TARGETS -> [Target Name] -> General -> Identity
- [ ] Change the "com.yourDomainNameHere" portion of the value in the "Bundle Identifier" text field to your real reverse domain name (i.e., "com.yourRealDomainName.Project-Name").
