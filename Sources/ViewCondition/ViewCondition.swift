import SwiftUI

/// An extension to the `View` protocol that provides conditional view modifiers.
///
/// This extension adds methods to SwiftUI's `View` type that allow you to conditionally
/// modify the view. These methods are useful for creating more readable and concise view
/// hierarchies in SwiftUI.
///
/// Methods:
/// - `if(_:content:)`: Applies a modifier to the view based on a condition.
/// - `visible(if:removeCompletely:)`: Conditionally shows or hides the view.
/// - `hide(if:removeCompletely:)`: Conditionally hides or removes the view.
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
}
