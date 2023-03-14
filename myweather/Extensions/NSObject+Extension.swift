//
//  NSObject+Extension.swift
//  Lecture11TableView
//
//  Created by LiziChichua on 03.12.22.
//

import Foundation

public extension NSObject {
    /// RDExtensionsSwift: Return class full name as String
    static var stringFromClass: String { return NSStringFromClass(self) }
    
    /// RDExtensionsSwift: Return class full name as String
    var stringFromClass: String { return NSStringFromClass(type(of: self)) }
    
    /// RDExtensionsSwift: Return class name as String
    static var className: String { return self.stringFromClass.components(separatedBy: ".").last! }
    
    /// RDExtensionsSwift: Return class name as String
    var className: String { return self.stringFromClass.components(separatedBy: ".").last! }
}
