import Foundation

public protocol TakeUnless {}

public extension TakeUnless {
    @inline(__always) func takeUnless(predicate: (Self) -> Bool) -> Self? {
        !predicate(self) ? self : nil
    }
}

extension NSObject: TakeUnless {}

extension Int: TakeUnless {}
extension UInt: TakeUnless {}
extension UInt8: TakeUnless {}
extension UInt16: TakeUnless {}
extension UInt32: TakeUnless {}
extension UInt64: TakeUnless {}

extension Float: TakeUnless {}
extension Double: TakeUnless {}
extension Bool: TakeUnless {}
extension String: TakeUnless {}
extension Character: TakeUnless {}
extension Optional: TakeUnless {}

extension Array: TakeUnless {}
extension Dictionary: TakeUnless {}


