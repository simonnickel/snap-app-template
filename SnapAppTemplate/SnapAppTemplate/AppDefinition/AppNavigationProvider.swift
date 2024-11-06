//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation
import SnapTemplateSettings

typealias Navigator = SnapNavigation.Navigator<AppNavigationProvider>

struct AppNavigationProvider: SnapNavigationProvider {
	
	typealias Destination = AppDestination
	
	func initial(for scene: SnapNavigation.NavigationScene<Destination>.Initializable) -> Destination {
		switch scene {
			case .main: .triangle
			case .settings: .settingsTemplate(.screen)
		}
	}
	
	var selectableDestinations: [Destination] { [.triangle, .rectangle, .circle] }
	
	func parent(of destination: Destination) -> Destination? {
		switch destination {
			case .triangle, .rectangle, .circle, .settingsTemplate(_): nil
			case .rectangleA, .rectangleB: .rectangle
			case .circleA: .circle
		}
	}
	
	func translate(_ destination: any SnapNavigationDestination) -> AppDestination? {
		switch destination {
			case let destination as AppDestination: destination
			
			case let destination as TemplateSettingsDestination: .settingsTemplate(destination)
			
			default: nil
		}
	}
}
