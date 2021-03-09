import Foundation

public protocol Takeif {}

public extension Takeif {
    @inline(__always) func takeIf(predicate: (Self) -> Bool) -> Self? {
        predicate(self) ? self : nil
    }
}

extension NSObject: Takeif {}

extension Int: Takeif {}
extension UInt: Takeif {}
extension UInt8: Takeif {}
extension UInt16: Takeif {}
extension UInt32: Takeif {}
extension UInt64: Takeif {}

extension Float: Takeif {}
extension Double: Takeif {}
extension Bool: Takeif {}
extension String: Takeif {}
extension Character: Takeif {}
extension Optional: Takeif {}

extension Array: Takeif {}
extension Dictionary: Takeif {}


