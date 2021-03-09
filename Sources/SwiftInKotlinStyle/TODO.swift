import Foundation

@inline(__always) public func TODO(_ reason: String) {
    #if DEBUG
    fatalError(reason)
    #endif
}
