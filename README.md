# EasyStack

A simple framework that makes it easy to work with UIStackView, increasing the speed of development
Swift compatible.

## Installation 
Use Swift Package Manager

## Usage
### Sample Code (Swift)

```swift
import EasyStack

// ------- I -------
	
	private var verticalStack = VerticalStack(alignment: .right)

	private func makeButtons() {
		let keyRows = [["1","2","3"],["4","5","6"],["7","8","9"],["*","0","#"]]
		keyRows.forEach { row in
			let rowStackView = HorizontalStack(alignment: .center)
			row.forEach {
				rowStackView.addArrangedSubview(makeButton(title: $0))
			}
			verticalStack.addArrangedSubview(rowStackView)
		}
	}

	
// ------- II -------
	
	private let keyboard = Keyboard()
	
	private func setupLayout() {
	// Attach layout to edges with edgeInsets (top = 500, left,right,bottom = 0)
	    keyboard.layout(fill: self.view, edgeInsets: UIEdgeInsets(top: 550,
															 left: 0,
															 bottom: 0,
															 right: 0))
	}
	
// ------- III -------
	
	// Combined stack with internal layout
	private lazy var labelsContainerView: UIView = {
	    let stack = VerticalStack(alignment: .leading, spacing: 2).push(
	        titleLabel,
	        Spaсer()
				.frame(width: 20, height: 20),
	        HorizontalStack(alignment: .firstTextBaseline, spacing: 3).push(
	            subtitleLabel,
	            extraSubtitleLabel
	            )
	    )
	    .padding(top: 4, left: 0, bottom: 4, right: 0)
	    return stack
	}

```

## License

EasyStack is available under the MIT license. See the [`LICENSE`](LICENSE) file for more info.
