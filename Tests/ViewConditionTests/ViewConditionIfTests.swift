//
//  ViewConditionIfTests.swift
//  ViewCondition
//
//  Created by Kevin Hermawan on 8/13/24.
//

import XCTest
@testable import ViewCondition
import SwiftUI
import ViewInspector

final class ViewExtensionIfTests: XCTestCase {
    func testIfModifierWithBooleanCondition() throws {
        let view = Text("Test")
            .if(true) { $0.foregroundColor(.red) }
        
        let text = try view.inspect().text()
        XCTAssertEqual(try text.attributes().foregroundColor(), .red)
        
        let view2 = Text("Test")
            .if(false) { $0.foregroundColor(.red) }
        
        let text2 = try view2.inspect().text()
        XCTAssertThrowsError(try text2.attributes().foregroundColor())
    }
    
    func testIfModifierWithOS() throws {
        let view = Text("Test")
            .if(os: .iOS) { $0.foregroundColor(.blue) }
        
#if os(iOS)
        let text = try view.inspect().text()
        XCTAssertEqual(try text.attributes().foregroundColor(), .blue)
#else
        let text = try view.inspect().text()
        XCTAssertThrowsError(try text.attributes().foregroundColor())
#endif
    }
    
    func testIfModifierWithCanImport() throws {
        let view = Text("Test")
            .if(canImport: .uiKit) { $0.foregroundColor(.green) }
        
#if canImport(UIKit)
        let text = try view.inspect().text()
        XCTAssertEqual(try text.attributes().foregroundColor(), .green)
#else
        let text = try view.inspect().text()
        XCTAssertThrowsError(try text.attributes().foregroundColor())
#endif
    }
    
    func testIfModifierWithMultipleConditions() throws {
        let view = Text("Test")
            .if([true, true, true]) { $0.foregroundColor(.yellow) }
        
        let text = try view.inspect().text()
        XCTAssertEqual(try text.attributes().foregroundColor(), .yellow)
        
        let view2 = Text("Test")
            .if([true, false, true]) { $0.foregroundColor(.yellow) }
        
        let text2 = try view2.inspect().text()
        XCTAssertThrowsError(try text2.attributes().foregroundColor())
    }
    
    func testIfModifierWithMultipleOS() throws {
        let view = Text("Test")
            .if(os: [.iOS, .macOS]) { $0.foregroundColor(.purple) }
        
#if os(iOS) || os(macOS)
        let text = try view.inspect().text()
        XCTAssertEqual(try text.attributes().foregroundColor(), .purple)
#else
        let text = try view.inspect().text()
        XCTAssertThrowsError(try text.attributes().foregroundColor())
#endif
    }
    
    func testIfModifierWithMultipleCanImport() throws {
        let view = Text("Test")
            .if(canImport: [.uiKit, .appKit]) { $0.foregroundColor(.orange) }
        
#if canImport(UIKit) || canImport(AppKit)
        let text = try view.inspect().text()
        XCTAssertEqual(try text.attributes().foregroundColor(), .orange)
#else
        let text = try view.inspect().text()
        XCTAssertThrowsError(try text.attributes().foregroundColor())
#endif
    }
}
