//
//  ViewConditionVisibleTests.swift
//  ViewCondition
//
//  Created by Kevin Hermawan on 8/13/24.
//

import XCTest
@testable import ViewCondition
import SwiftUI
import ViewInspector

final class ViewExtensionVisibleTests: XCTestCase {
    func testVisibleModifierWithBooleanCondition() throws {
        let view = Text("Test")
            .visible(if: true)
        
        XCTAssertNoThrow(try view.inspect().find(ViewType.Text.self))
        
        let view2 = Text("Test")
            .visible(if: false)
        
        let text2 = try view2.inspect().find(ViewType.Text.self)
        XCTAssertTrue(text2.isHidden())
    }
    
    func testVisibleModifierWithBooleanConditionAndRemoveCompletely() throws {
        let view = Text("Test")
            .visible(if: false, removeCompletely: true)
        
        XCTAssertThrowsError(try view.inspect().find(ViewType.Text.self))
        XCTAssertNoThrow(try view.inspect().emptyView())
    }
    
    func testVisibleModifierWithOS() throws {
        let view = Text("Test")
            .visible(on: .iOS)
        
#if os(iOS)
        XCTAssertNoThrow(try view.inspect().find(ViewType.Text.self))
#else
        XCTAssertThrowsError(try view.inspect().find(ViewType.Text.self))
        XCTAssertNoThrow(try view.inspect().emptyView())
#endif
    }
    
    func testVisibleModifierWithCanImport() throws {
        let view = Text("Test")
            .visible(ifCanImport: .uiKit)
        
#if canImport(UIKit)
        XCTAssertNoThrow(try view.inspect().find(ViewType.Text.self))
#else
        XCTAssertThrowsError(try view.inspect().find(ViewType.Text.self))
        XCTAssertNoThrow(try view.inspect().emptyView())
#endif
    }
    
    func testVisibleModifierWithMultipleConditions() throws {
        let view = Text("Test")
            .visible(if: [true, true, true])
        
        XCTAssertNoThrow(try view.inspect().find(ViewType.Text.self))
        
        let view2 = Text("Test")
            .visible(if: [true, false, true])
        
        let text2 = try view2.inspect().find(ViewType.Text.self)
        XCTAssertTrue(text2.isHidden())
    }
    
    func testVisibleModifierWithMultipleOS() throws {
        let view = Text("Test")
            .visible(on: [.iOS, .macOS])
        
#if os(iOS) || os(macOS)
        XCTAssertNoThrow(try view.inspect().find(ViewType.Text.self))
#else
        XCTAssertThrowsError(try view.inspect().find(ViewType.Text.self))
        XCTAssertNoThrow(try view.inspect().emptyView())
#endif
    }
    
    func testVisibleModifierWithMultipleCanImport() throws {
        let view = Text("Test")
            .visible(ifCanImport: [.uiKit, .appKit])
        
#if canImport(UIKit) || canImport(AppKit)
        XCTAssertNoThrow(try view.inspect().find(ViewType.Text.self))
#else
        XCTAssertThrowsError(try view.inspect().find(ViewType.Text.self))
        XCTAssertNoThrow(try view.inspect().emptyView())
#endif
    }
}
