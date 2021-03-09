import Foundation

public extension Optional {
    typealias Transform<U> = (Wrapped) throws -> U

    @discardableResult
    @inline(__always) func `let`<U>(_ transform: Transform<U>) rethrows -> U? {
        try map(transform)
    }
}

