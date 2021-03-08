import Foundation

extension Optional {
    typealias Transform<U> = (Wrapped) throws -> U

    @discardableResult
    func `let`<U>(_ transform: Transform<U>) rethrows -> U? {
        try map(transform)
    }
}

