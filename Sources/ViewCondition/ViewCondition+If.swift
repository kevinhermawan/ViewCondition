//
//  ViewCondition+If.swift
//  ViewCondition
//
//  Created by Kevin Hermawan on 8/13/24.
//

import Foundation
import SwiftUI

/// An extension to the `View` protocol providing conditional view modifiers.
public extension View {
    /// Conditionally applies a modifier to the view.
    ///
    /// This method is used to apply a custom modifier to a view if a specified condition
    /// is true. If the condition is met, the `content` closure is executed with `self`
    /// as its argument. Otherwise, the view remains unchanged.
    ///
    /// - Parameters:
    ///   - condition: A Boolean value determining the application of the modifier.
    ///   - content: A closure that takes the current view and returns a modified view.
    /// - Returns: The view, modified if the condition is true; otherwise, the original view.
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, content: (Self) -> Content) -> some View {
        if condition {
            content(self)
        } else {
            self
        }
    }
    
    /// Applies a modifier to the view based on the operating system.
    ///
    /// This method allows for conditional modification of a view based on the operating system.
    ///
    /// - Parameters:
    ///   - os: The operating system to check against.
    ///   - content: A closure that modifies the view.
    /// - Returns: A modified view for the specified OS; otherwise, the original view.
    @ViewBuilder
    func `if`<Content: View>(os: OS, content: (Self) -> Content) -> some View {
        switch os {
        case .iOS:
#if os(iOS)
            content(self)
#else
            self
#endif
        case .macOS:
#if os(macOS)
            content(self)
#else
            self
#endif
        case .tvOS:
#if os(tvOS)
            content(self)
#else
            self
#endif
        case .visionOS:
#if os(visionOS)
            content(self)
#else
            self
#endif
        case .watchOS:
#if os(watchOS)
            content(self)
#else
            self
#endif
        }
    }
    
    /// Applies a modifier to the view based on the availability of a module.
    ///
    /// This method allows for conditional modification of a view based on whether a specific module can be imported.
    ///
    /// - Parameters:
    ///   - module: The module to check for import availability.
    ///   - content: A closure that modifies the view.
    /// - Returns: A modified view if the module can be imported; otherwise, the original view.
    @ViewBuilder
    func `if`(canImport module: Module, content: (Self) -> some View) -> some View {
        switch module {
        case .uiKit:
#if canImport(UIKit)
            content(self)
#else
            self
#endif
        case .appKit:
#if canImport(AppKit)
            content(self)
#else
            self
#endif
        case .watchKit:
#if canImport(WatchKit)
            content(self)
#else
            self
#endif
        case .tvUIKit:
#if canImport(TVUIKit)
            content(self)
#else
            self
#endif
        }
    }
    
    /// Conditionally applies a modifier to the view based on multiple conditions.
    ///
    /// This method applies a custom modifier to a view if all specified conditions are true.
    ///
    /// - Parameters:
    ///   - conditions: An array of Boolean values determining the application of the modifier.
    ///   - content: A closure that takes the current view and returns a modified view.
    /// - Returns: The view, modified if all conditions are true; otherwise, the original view.
    @ViewBuilder
    func `if`<Content: View>(_ conditions: [Bool], content: (Self) -> Content) -> some View {
        if conditions.allSatisfy({ $0 }) {
            content(self)
        } else {
            self
        }
    }
    
    /// Applies modifiers to the view based on multiple operating systems.
    ///
    /// This method allows for conditional modification of a view based on multiple operating systems.
    ///
    /// - Parameters:
    ///   - oses: An array of operating systems to check against.
    ///   - content: A closure that modifies the view.
    /// - Returns: A modified view if any of the specified OS conditions are met; otherwise, the original view.
    @ViewBuilder
    func `if`<Content: View>(os oses: [OS], content: (Self) -> Content) -> some View {
        if oses.contains(where: { os in
            switch os {
            case .iOS:
#if os(iOS)
                return true
#else
                return false
#endif
            case .macOS:
#if os(macOS)
                return true
#else
                return false
#endif
            case .tvOS:
#if os(tvOS)
                return true
#else
                return false
#endif
            case .visionOS:
#if os(visionOS)
                return true
#else
                return false
#endif
            case .watchOS:
#if os(watchOS)
                return true
#else
                return false
#endif
            }
        }) {
            content(self)
        } else {
            self
        }
    }
    
    /// Applies a modifier to the view based on the availability of multiple modules.
    ///
    /// This method allows for conditional modification of a view based on whether specific modules can be imported.
    ///
    /// - Parameters:
    ///   - modules: An array of modules to check for import availability.
    ///   - content: A closure that modifies the view.
    /// - Returns: A modified view if any of the specified modules can be imported; otherwise, the original view.
    @ViewBuilder
    func `if`(canImport modules: [Module], content: (Self) -> some View) -> some View {
        if modules.contains(where: { module in
            switch module {
            case .uiKit:
#if canImport(UIKit)
                return true
#else
                return false
#endif
            case .appKit:
#if canImport(AppKit)
                return true
#else
                return false
#endif
            case .watchKit:
#if canImport(WatchKit)
                return true
#else
                return false
#endif
            case .tvUIKit:
#if canImport(TVUIKit)
                return true
#else
                return false
#endif
            }
        }) {
            content(self)
        } else {
            self
        }
    }
}
