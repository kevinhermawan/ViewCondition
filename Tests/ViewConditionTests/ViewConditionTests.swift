import XCTest
@testable import ViewCondition
import SwiftUI
import ViewInspector

final class ViewConditionTests: XCTestCase {
    func testIfModifierTrue() throws {
        let view = Text("Original").if(true) { text in
            Text("Modified")
        }
        
        let text = try view.inspect().text().string()
        XCTAssertEqual(text, "Modified")
    }
    
    func testIfModifierFalse() throws {
        let view = Text("Original").if(false) { _ in
            Text("Modified")
        }
        
        let text = try view.inspect().text().string()
        XCTAssertEqual(text, "Original")
    }
    
    func testIfOSModifier() throws {
        let view = Text("Original").if(os: .iOS) { text in
            Text("iOS")
        }
        
#if os(iOS)
        let text = try view.inspect().text().string()
        XCTAssertEqual(text, "iOS")
#else
        let text = try view.inspect().text().string()
        XCTAssertEqual(text, "Original")
#endif
    }
    
    func testIfCanImportModifier() throws {
        let view = Text("Original").if(canImport: .uiKit) { text in
            Text("UIKit")
        }
        
#if canImport(UIKit)
        let text = try view.inspect().text().string()
        XCTAssertEqual(text, "UIKit")
#else
        let text = try view.inspect().text().string()
        XCTAssertEqual(text, "Original")
#endif
    }
    
    func testVisibleModifierTrue() throws {
        let view = Text("Visible").visible(if: true)
        
        let isHidden = try view.inspect().text().isHidden()
        XCTAssertFalse(isHidden)
    }
    
    func testVisibleModifierFalse() throws {
        let view = Text("Visible").visible(if: false)
        
        let isHidden = try view.inspect().text().isHidden()
        XCTAssertTrue(isHidden)
    }
    
    func testVisibleModifierFalseRemoveCompletely() throws {
        let view = Text("Visible").visible(if: false, removeCompletely: true)
        
        XCTAssertThrowsError(try view.inspect().text()) { error in
            XCTAssertTrue(error is InspectionError)
        }
    }
    
    func testVisibleOnOS() throws {
        let view = Text("Visible").visible(on: .iOS)
        
#if os(iOS)
        XCTAssertNoThrow(try view.inspect().text())
#else
        XCTAssertThrowsError(try view.inspect().text()) { error in
            XCTAssertTrue(error is InspectionError)
        }
#endif
    }
    
    func testVisibleIfCanImport() throws {
        let view = Text("Visible").visible(ifCanImport: .uiKit)
        
#if canImport(UIKit)
        XCTAssertNoThrow(try view.inspect().text())
#else
        XCTAssertThrowsError(try view.inspect().text()) { error in
            XCTAssertTrue(error is InspectionError)
        }
#endif
    }
    
    func testHideModifierTrue() throws {
        let view = Text("Hidden").hide(if: true)
        
        let isHidden = try view.inspect().text().isHidden()
        XCTAssertTrue(isHidden)
    }
    
    func testHideModifierFalse() throws {
        let view = Text("Hidden").hide(if: false)
        
        let isHidden = try view.inspect().text().isHidden()
        XCTAssertFalse(isHidden)
    }
    
    func testHideModifierTrueRemoveCompletely() throws {
        let view = Text("Hidden").hide(if: true, removeCompletely: true)
        
        XCTAssertThrowsError(try view.inspect().text()) { error in
            XCTAssertTrue(error is InspectionError)
        }
    }
    
    func testHideOnOS() throws {
        let view = Text("Hidden").hide(on: .iOS)
        
#if os(iOS)
        XCTAssertThrowsError(try view.inspect().text()) { error in
            XCTAssertTrue(error is InspectionError)
        }
#else
        XCTAssertNoThrow(try view.inspect().text())
#endif
    }
    
    func testHideIfCanImport() throws {
        let view = Text("Hidden").hide(ifCanImport: .uiKit)
        
#if canImport(UIKit)
        XCTAssertThrowsError(try view.inspect().text()) { error in
            XCTAssertTrue(error is InspectionError)
        }
#else
        XCTAssertNoThrow(try view.inspect().text())
#endif
    }
}
