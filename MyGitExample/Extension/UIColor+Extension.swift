//
//  UIColor+Extension.swift
//  MyGitExample
//
//  Created by bro on 2022/06/26.
//

import UIKit

extension UIColor {
    
    static func rgbColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
    static let searchBarBackground: UIColor = {
        if #available(iOS 13, *) {
            return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                if UITraitCollection.userInterfaceStyle == .dark {
                    // Return color for Dark Mode
                    return rgbColor(red: 28, green: 28, blue: 31, alpha: 1)
                    //return UIColor(red: 28/255, green: 28/255, blue: 31/255, alpha: 1.0)
                } else {
                    // Return color for Light Mode
                    return rgbColor(red: 240, green: 240, blue: 240, alpha: 1)
                    //return UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
                }
            }
        } else {
            // Return fallback color for iOS 12 and lower
            return rgbColor(red: 240, green: 240, blue: 240, alpha: 1)
            //return UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
        }
    }()
    
    static let mainBackground: UIColor = {
        if #available(iOS 13, *) {
            return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                if UITraitCollection.userInterfaceStyle == .dark {
                    // Return color for Dark Mode
                    return rgbColor(red: 0, green: 0, blue: 0, alpha: 1)
                    //return UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
                } else {
                    // Return color for Light Mode
                    return rgbColor(red: 255, green: 255, blue: 255, alpha: 1)
                    //return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
                }
            }
        } else {
            // Return fallback color for iOS 12 and lower
            return rgbColor(red: 255, green: 255, blue: 255, alpha: 1)
            //return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        }
    }()
    
    static let lableColor: UIColor = {
        if #available(iOS 13, *) {
            return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                if UITraitCollection.userInterfaceStyle == .dark {
                    // Return color for Dark Mode
                    return rgbColor(red: 255, green: 255, blue: 255, alpha: 1)
                    //return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
                } else {
                    // Return color for Light Mode
                    return rgbColor(red: 0, green: 0, blue: 0, alpha: 1)
                    //return UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
                }
            }
        } else {
            // Return fallback color for iOS 12 and lower
            return rgbColor(red: 0, green: 0, blue: 0, alpha: 1)
            //return UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        }
    }()
    
    static let searchIconColor: UIColor = {
        if #available(iOS 13, *) {
            return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                if UITraitCollection.userInterfaceStyle == .dark {
                    // Return color for Dark Mode
                    return rgbColor(red: 255, green: 255, blue: 255, alpha: 1)
                    //return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
                } else {
                    // Return color for Light Mode
                    return rgbColor(red: 0, green: 0, blue: 0, alpha: 1)
                    //return UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
                }
            }
        } else {
            // Return fallback color for iOS 12 and lower
            return rgbColor(red: 0, green: 0, blue: 0, alpha: 1)
            //return UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        }
    }()
    
    static let toolbarActiveColor: UIColor = {
        if #available(iOS 13, *) {
            return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                if UITraitCollection.userInterfaceStyle == .dark {
                    // Return color for Dark Mode
                    return rgbColor(red: 255, green: 255, blue: 255, alpha: 1)
                    //return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
                } else {
                    // Return color for Light Mode
                    return rgbColor(red: 0, green: 0, blue: 0, alpha: 1)
                    //return UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
                }
            }
        } else {
            // Return fallback color for iOS 12 and lower
            return rgbColor(red: 0, green: 0, blue: 0, alpha: 1)
            //return UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        }
    }()
    
    static let toolbarinActiveColor: UIColor = {
        if #available(iOS 13, *) {
            return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                if UITraitCollection.userInterfaceStyle == .dark {
                    // Return color for Dark Mode
                    return rgbColor(red: 71, green: 70, blue: 74, alpha: 1)
                    //return UIColor(red: 71/255, green: 70/255, blue: 74/255, alpha: 1.0)
                } else {
                    // Return color for Light Mode
                    return rgbColor(red: 199, green: 199, blue: 204, alpha: 1)
                    //return UIColor(red: 199/255, green: 199/255, blue: 204/255, alpha: 1.0)
                }
            }
        } else {
            // Return fallback color for iOS 12 and lower
            return rgbColor(red: 199, green: 199, blue: 204, alpha: 1)
            //return UIColor(red: 199/255, green: 199/255, blue: 204/255, alpha: 1.0)
        }
    }()
    
    static let buttonImageColor: UIColor = {
        if #available(iOS 13, *) {
            return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                if UITraitCollection.userInterfaceStyle == .dark {
                    // Return color for Dark Mode
                    //return rgbColor(red: 255, green: 204, blue: 102, alpha: 1)
                    return UIColor(named: "myTintColor")!
                } else {
                    // Return color for Light Mode
                    //return rgbColor(red: 255, green: 204, blue: 102, alpha: 1)
                    return UIColor(named: "myTintColor")!
                }
            }
        } else {
            // Return fallback color for iOS 12 and lower
            //return rgbColor(red: 255, green: 204, blue: 102, alpha: 1)
            return UIColor(named: "myTintColor")!
        }
    }()
    
}
