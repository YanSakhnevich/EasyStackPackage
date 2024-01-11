# EasyStack

![Swift 5](https://img.shields.io/badge/Swift-5-orange.svg) ![iOS 13.0+](https://img.shields.io/badge/iOS-13.0%2B-blue.svg) [![License](https://img.shields.io/cocoapods/l/EasyStack.svg?style=flat)](https://github.com/YanSakhnevich/EasyStackPackage/blob/main/LICENSE) [![Donate](https://img.shields.io/badge/Donate-PayPal-blue.svg)](https://paypal.me/sakhny)

A simple framework that simplifies working with UIStackView, increasing the speed of development. Also has some useful extensions for UIView.

Swift compatible.

## Installation
Use Swift Package Manager

## Tools for working with functionality
```swift
///  Spacebar, which adds white space to View
Spacer()

///  Horizontal stack initializer
///  - Parameters:
///  - alignment: Vertical alignment
///  - spacing: Spacing between elements
HorizontalStack(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil)

///  Vertical stack initializer
///  - Parameters:
///  - alignment: Vertical alignment
///  - spacing: Spacing between elements
VerticalStack(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil)

///  Add a view to display
///  - Parameter  subviews: Views for display
func push(_ subviews: UIView...) -> VerticalStack / HorizontalStack
```

## Usage

### Sample Code (Swift)

Below are some examples of working with the functionality of the framework

```swift

import EasyStack

	private var verticalStack = VerticalStack(alignment: .right)

	private func makeButtons() {
		let keyRows = [["1","2","3"],["4","5","6"],["7","8","9"],["*","0","#"]]
		keyRows.forEach { row in
			let rowStackView = HorizontalStack(alignment: .center)
			row.forEach { rowStackView.addArrangedSubview(makeButton(title: $0)) }
			verticalStack.addArrangedSubview(rowStackView)
		}
	}
```
	
```swift
import EasyStack
	
	private let keyboard = Keyboard()
	
	private func setupLayout() {
		// Attach layout to edges with edgeInsets (top = 500, left,right,bottom = 0)
		keyboard.layout(fill: self.view, edgeInsets: UIEdgeInsets(top: 550, left: 0, bottom: 0, right: 0))
	}
```
	
```swift
import EasyStack

// Combined stack with internal layout
	private lazy var labelsContainerView: UIView = {
		let stack = VerticalStack(alignment: .leading, spacing: 2).push(
			titleLabel,
			Spacer()
				.frame(width: 20, height: 20),
			HorizontalStack(alignment: .firstTextBaseline, spacing: 3).push(
				subtitleLabel,
				extraSubtitleLabel
			)
			// setup HorizontalStack view
			.setup {
			$0.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
			}
		)
			.padding(top: 4, left: 0, bottom: 4, right: 0)
		return stack
	}
```

## Useful extensions for UIView
```swift
///  Setup view
///  - Parameters:
///  - closure: Closure to which the view is passed, which needs to be configured
///  - Returns: The same instance from which the method was called
func setup(with closure: ((Self) -> Void)? = nil) -> Self

///  Fix width and height
///  - Parameters:
/// - width: Width
/// - height: Height
func frame(width: CGFloat? = nil, height: CGFloat? = nil) -> UIView

///  Add indentations
///  - Parameters:
///  - left: Left indent
///  - top: Top indent
///  - right: Right Indent
///  - bottom: Bottom indent
func padding(left: CGFloat = 0, top: CGFloat = 0, right: CGFloat = 0, bottom: CGFloat = 0) -> UIView

///  Attach layout to edges
///  - Parameters:
///  - fill: View for filling
///  - edgeInsets: Edge padding
func layout(fill view: UIView, edgeInsets insets: UIEdgeInsets = .zero)
```

## License
EasyStack is available under the MIT license. See the [`LICENSE`](LICENSE) file for more info.
