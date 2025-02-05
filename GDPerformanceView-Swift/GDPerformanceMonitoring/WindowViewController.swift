//
// Copyright © 2017 Gavrilov Daniil
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

import UIKit

// MARK: Class Definition

/// A window controller to override the properties of the status bar so that developers can choose their own preferences.
internal class WindowViewController: UIViewController, StatusBarConfigurator {
    
    // MARK: Public Properties
    
    /// Overrides prefersStatusBarHidden.
    public var statusBarHidden = false {
        didSet {
            #if !os(tvOS)
            self.setNeedsStatusBarAppearanceUpdate()
            #endif
        }
    }
    
    /// Overrides preferredStatusBarStyle.
    #if !os(tvOS)
    public var statusBarStyle = UIStatusBarStyle.default {
        didSet {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    // MARK: Properties Overriders
    override var prefersStatusBarHidden: Bool {
        get {
            return self.statusBarHidden
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return self.statusBarStyle
        }
    }
    #endif
    
    // MARK: Init Methods & Superclass Overriders
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .clear
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
