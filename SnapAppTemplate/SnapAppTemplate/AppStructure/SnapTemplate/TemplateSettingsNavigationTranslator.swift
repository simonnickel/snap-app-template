//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation
import SnapDependencies
import SnapTemplateShared

struct TemplateSettingsNavigationTranslator: TemplateSettingsNavigator {
	
	@Dependency private var navigator: Navigator
	
	@MainActor
	public func navigate(to destination: TemplateSettingsDestination) {
		navigator.navigate(to: AppDestination.settingsTemplate(destination))
	}
	
	@MainActor
	public func present(destination: Destination, style styleOverride: SnapNavigation.PresentationStyle? = nil) {
		navigator.present(destination: AppDestination.settingsTemplate(destination), style: styleOverride)
	}
	
}
