import XCTest
@testable import SwiftInKotlinStyle

class AObject: NSObject {
    var name: String = ""
}

class AClass: Alsoable, Equatable {
    var name: String = ""
    
    static func == (lhs: AClass, rhs: AClass) -> Bool {
        lhs.name == rhs.name
    }
}

struct AStruct: Alsoable, Equatable {
    var name: String = ""
}

final class ScopeFunctionTests: XCTestCase {
    
    func test_also_NSObject() throws {
        let obj = AObject()
        
        let appliedObj = obj.also {
            $0.name = "new name"
        }
        
        XCTAssertEqual(obj.name, "new name")
        XCTAssertTrue(obj === appliedObj)
    }
    
    func test_also_class() throws {
        var instance = AClass()
        instance.also { it in
            it.name = "new name"
        }
        XCTAssertEqual(instance.name, "new name")
        
        
        let appliedInstance = instance.also { it in
            it.name = "another name"
        }
        XCTAssertEqual(instance.name, "another name")
        XCTAssertTrue(instance == appliedInstance)
    }
    
    func test_also_struct() throws {
        var aStruct = AStruct()
        aStruct.also { it in
            it.name = "new name"
        }
        XCTAssertEqual(aStruct.name, "new name")
        
        
        let appliedStruct = aStruct.also { it in
            it.name = "another name"
        }
        XCTAssertEqual(aStruct.name, "another name")
        XCTAssertTrue(aStruct == appliedStruct)
    }
    
    func test_let() throws {
        var int: Int? = 1
        int.let { XCTAssertEqual($0, 1) }
        
        let string = int.let { it in
            "\(it)"
        }
        XCTAssertEqual(string, "1")
        
        
        let double = int.let { it in
            Double(it+1)*10.0
        }
        XCTAssertEqual(double, 20.0)
        XCTAssertEqual(Mirror(reflecting: double as Any).description, "Mirror for Optional<Double>")
        
        int = nil
        int.let { _ in
            XCTFail("if nil, never call")
        }
    }
    
    func test_takeIf() throws {
        let a = 4
        let b = a.takeIf { $0 % 2 == 0 }
        XCTAssertEqual(b, 4)
        
        let c = 3
        let d = c.takeIf { $0 % 2 == 0 }
        XCTAssertEqual(d, nil)
    }
    
    func test_takeUnless() throws {
        let a = 4
        let b = a.takeUnless { $0 % 2 == 1 }
        XCTAssertEqual(b, 4)
        
        let c = 3
        let d = c.takeUnless { $0 % 2 == 1 }
        XCTAssertEqual(d, nil)
    }
    
    func test_repeat() throws {
        var arr1 = [Int]()
        `repeat`(times: 4) {
            arr1.append($0)
        }
        
        var arr2 = [Int]()
        4.repeat {
            arr2.append($0)
        }
        
        XCTAssertEqual(arr1, [0, 1, 2, 3])
        XCTAssertEqual(arr1, arr2)
    }
    
    static var allTests = [
        ("test_also_NSObject", test_also_NSObject),
        ("test_also_class", test_also_class),
        ("test_also_struct", test_also_struct),
        
        ("test_let", test_let),
        ("test_takeIf", test_takeIf),
        ("test_takeUnless", test_takeUnless),
        ("test_repeat", test_repeat)
    ]
}
