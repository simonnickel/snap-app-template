//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation

typealias Navigator = SnapNavigation.Navigator<AppNavigationProvider>

struct AppNavigationProvider: SnapNavigationProvider {
	
	typealias Screen = AppScreen
	
	var initialSelection: Screen { .triangle }
	
	var selectableScreens: [Screen] { [.triangle, .rectangle, .circle] }
	
	func parent(of screen: Screen) -> Screen? {
		switch screen {
			case .triangle, .rectangle, .circle: nil
			case .rectangleA, .rectangleB: .rectangle
			case .circleA: .circle
				
			case .settings: nil
		}
	}
	
}
