//
//  ViewCondition.swift
//
//
//  Created by Kevin Hermawan on 02/12/23.
//

import SwiftUI

/// An extension to the `View` protocol providing conditional view modifiers.
///
/// This extension enriches SwiftUI's `View` type with methods that enable conditional
/// modifications of views. These additions are particularly beneficial for creating
/// readable and concise view hierarchies in SwiftUI.
///
/// Methods:
/// - `if(_:content:)`: Applies a modifier to the view based on a condition.
/// - `if(os:content:)`: Applies a modifier to the view based on the operating system.
/// - `visible(if:removeCompletely:)`: Conditionally shows or hides the view based on a Boolean condition.
/// - `visible(on:)`: Conditionally shows or hides the view based on the operating system.
/// - `hide(if:removeCompletely:)`: Conditionally hides or removes the view based on a Boolean condition.
/// - `hide(on:)`: Conditionally hides or removes the view based on the operating system.
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
    /// This method allows for conditional modification of a view based on the operating system. It internally
    /// utilizes `if(_:content:)` to apply the modification.
    ///
    /// - Parameters:
    ///   - os: The operating system to check against.
    ///   - content: A closure that modifies the view.
    /// - Returns: A modified view for the specified OS; otherwise, the original view.
    @ViewBuilder
    func `if`<Content: View>(os: OperatingSystem, content: (Self) -> Content) -> some View {
        #if os(iOS)
        self.if(os == .iOS, content: content)
        #elseif os(macOS)
        self.if(os == .macOS, content: content)
        #endif
    }
    
    /// Controls the view's visibility, with an option to remove it when not visible.
    ///
    /// This method conditionally displays the view. If the `condition` is false,
    /// the view is either made invisible or completely removed from the view hierarchy,
    /// based on the value of `removingIfInvisible`.
    ///
    /// - Parameters:
    ///   - condition: A Boolean value determining the view's visibility.
    ///   - removeCompletely: If true, removes the view when not visible; if false, hides it.
    /// - Returns: The original view, a hidden view, or an `EmptyView`, contingent upon the condition.
    @ViewBuilder
    func visible(if condition: Bool, removeCompletely: Bool = false) -> some View {
        if condition {
            self
        } else {
            if removeCompletely {
                EmptyView()
            } else {
                self.hidden()
            }
        }
    }
    
    /// Controls the view's visibility based on the operating system.
    ///
    /// This method conditionally displays the view depending on the operating system.
    /// It leverages the `visible(if:removeCompletely:)` method to manage visibility.
    ///
    /// - Parameters:
    ///   - os: The operating system to check against.
    /// - Returns: The view, either as is or as an `EmptyView`, based on the operating system.
    @ViewBuilder
    func visible(on os: OperatingSystem) -> some View {
        #if os(iOS)
        self.visible(if: os == .iOS, removeCompletely: true)
        #elseif os(macOS)
        self.visible(if: os == .macOS, removeCompletely: true)
        #endif
    }
    
    /// Hides the view based on a condition, with an option to remove it when hidden.
    ///
    /// This method hides the view if the specified `condition` is true. Depending on
    /// `removingIfHidden`, the view is either hidden or completely removed from the view hierarchy.
    ///
    /// - Parameters:
    ///   - condition: A Boolean value determining if the view should be hidden.
    ///   - removeCompletely: Determines whether the view is removed (`true`) or just hidden (`false`) when the condition is met.
    /// - Returns: A hidden view, an `EmptyView`, or the original view, based on the condition.
    @ViewBuilder
    func hide(if condition: Bool, removeCompletely: Bool = false) -> some View {
        if condition {
            if removeCompletely {
                EmptyView()
            } else {
                self.hidden()
            }
        } else {
            self
        }
    }
    
    /// Hides the view based on the operating system.
    ///
    /// This method hides the view depending on the operating system. It uses the `hide(if:removeCompletely:)` method
    /// internally to determine visibility.
    ///
    /// - Parameters:
    ///   - os: The operating system to check against.
    /// - Returns: A hidden view or the original view, contingent upon the operating system.
    @ViewBuilder
    func hide(on os: OperatingSystem) -> some View {
        #if os(iOS)
        self.hide(if: os == .iOS, removeCompletely: true)
        #elseif os(macOS)
        self.hide(if: os == .macOS, removeCompletely: true)
        #endif
    }
}
