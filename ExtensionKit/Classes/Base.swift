//
//  Base.swift
//  ExtensionKit
//
//  Created by Hao Wang on 25/03/2018.
//

import Foundation

// MARK: - Base
public protocol Emptable {
    var isEmpty: Bool { get }
}

extension Swift.Optional where Wrapped: Emptable {
    public var isEmpty: Bool {
        return self?.isEmpty ?? true
    }
}

// MARK: - Int Extension
extension Int {
    public static func random() -> Int {
        return Int(arc4random())
    }
    
    public static func random(from: Int, to: Int) -> Int {
        return from + (Int(arc4random()) % (to - from))
    }
}

// MARK: - Character Extension
extension Character {
    public static func random() -> Character {
        return Character(UnicodeScalar(Int.random(from: 65, to: 90)) ?? "A")
    }
}
