//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies
import SnapNavigation
import SnapTemplateSettings
import SwiftUI

struct TemplateSettingsDestinationTranslator: TemplateSettingsNavigator {
	
	let navigator: Navigator
	
	@MainActor
	public func navigate(to destination: TemplateSettingsDestination) {
		navigator.navigate(to: AppDestination.settingsTemplate(destination))
	}
	
	@MainActor
	public func present(destination: Destination, style styleOverride: SnapNavigation.PresentationStyle? = nil) {
		navigator.present(destination: AppDestination.settingsTemplate(destination), style: styleOverride)
	}
	
}


// MARK: - View Modifier

public extension View {
	
	func setupTemplateSettingsNavigator() -> some View {
		modifier(TemplateSettingsNavigatorModifier())
	}
	
}

internal struct TemplateSettingsNavigatorModifier : ViewModifier {

	@Environment(Navigator.self) private var navigator
	
	internal func body(content: Content) -> some View {
		content
			.environment(\.navigatorSettings, TemplateSettingsDestinationTranslator(navigator: navigator))
	}
	
}