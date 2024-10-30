//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies
import SnapNavigation
import SnapTemplateSettings

struct TemplateSettingsNavigationTranslator: TemplateSettingsNavigator {
	
	@Dependency(\.navigator) private var navigator: Navigator
	
	@MainActor
	public func navigate(to destination: TemplateSettingsDestination) {
		navigator.navigate(to: AppDestination.settingsTemplate(destination))
	}
	
	@MainActor
	public func present(destination: Destination, style styleOverride: SnapNavigation.PresentationStyle? = nil) {
		navigator.present(destination: AppDestination.settingsTemplate(destination), style: styleOverride)
	}
	
}
