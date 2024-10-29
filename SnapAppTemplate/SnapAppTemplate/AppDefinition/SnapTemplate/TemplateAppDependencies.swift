//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies
import SnapTemplate
import SnapTemplateSettings

public enum TemplateAppDependencies {
	
	public static func registerDependencies() {
		
		// MARK: - App Dependencies
		
		Dependencies.register(type: Navigator.self) { Navigator(provider: AppNavigationProvider()) }
		
		
		// MARK: - Template Dependencies
		
		TemplateDependencies.registerDependencies()
		Dependencies.register(type: TemplateSettingsNavigator.self) { TemplateSettingsNavigationTranslator() }
		
	}
	
}
