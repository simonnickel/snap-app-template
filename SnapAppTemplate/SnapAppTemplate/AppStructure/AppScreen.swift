//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapNavigation
import SnapTheme

enum AppScreen: SnapNavigationScreen {
		
	case rectangle
	case rectangleA, rectangleB
	
	case circle
	case circleA
	
	case triangle
	
	case settings

	var definition: SnapNavigation.ScreenDefinition<Self> {
		switch self {
			case .rectangle: .init(title: "Rectangle", icon: Theme.IconKey.navGroupRectangle)
			case .rectangleA: .init(title: "Rectangle A", icon: Theme.IconKey.navGroupRectangle.id)
			case .rectangleB: .init(title: "Rectangle B", icon: Theme.IconKey.navGroupRectangle.id)
				
			case .circle: .init(title: "Circle", icon: Theme.IconKey.navGroupCircle)
			case .circleA: .init(title: "Circle A", icon: Theme.IconKey.navGroupCircle)
				
			case .triangle: .init(title: "Triangle", icon: Theme.IconKey.navGroupTriangle)
			
			case .settings: .init(title: "Settings", icon: Theme.IconKey.settings) { _ in SettingsScene() }
		}
	}
	
	
	// MARK: Definition Overrides

	@MainActor
	var label: any View {
		let icon = definition.icon as? Theme.IconKey
		return ThemeLabel(text: definition.title, icon: icon)
	}
	
	@MainActor
	var destination: any View {
		definition.destination?(self) ?? ExampleScreen(screen: self)
	}
	
}
