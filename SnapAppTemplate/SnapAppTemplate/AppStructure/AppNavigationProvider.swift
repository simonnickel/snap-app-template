//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation

typealias Navigator = SnapNavigation.Navigator<AppNavigationProvider>

struct AppNavigationProvider: SnapNavigationProvider {
	
	typealias Destination = AppDestination
	
	var initialSelection: Destination { .triangle }
	
	var selectableDestinations: [Destination] { [.triangle, .rectangle, .circle] }
	
	func parent(of destination: Destination) -> Destination? {
		switch destination {
			case .triangle, .rectangle, .circle, .settingsTemplate(_): nil
			case .rectangleA, .rectangleB: .rectangle
			case .circleA: .circle
		}
	}
	
}
