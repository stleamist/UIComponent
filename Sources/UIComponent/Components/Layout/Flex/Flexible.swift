//  Created by Luke Zhao on 8/23/20.

import UIKit

public protocol AnyFlexible {
    var flexGrow: CGFloat { get }
    var flexShrink: CGFloat { get }
    var alignSelf: CrossAxisAlignment? { get }
}

/// # Flexible Component
///
/// Wraps a child component and marking it for the flex layouts to treat it as flexible.
///
/// Instead of using it directly, you can use `.flex()` modifier on any component to mark it as flexible.
///
/// Checkout the `FlexLayoutViewController.swift` for more examples.
public struct Flexible<Content: Component>: Component, AnyFlexible {
    public let flexGrow: CGFloat
    public let flexShrink: CGFloat
    public let alignSelf: CrossAxisAlignment?
    public let child: Content
    public func layout(_ constraint: Constraint) -> FlexibleRenderNode<Content.R> {
        FlexibleRenderNode(content: child.layout(constraint))
    }
}

public struct FlexibleRenderNode<Content: RenderNode>: RenderNodeWrapper {
    public let content: Content
}
