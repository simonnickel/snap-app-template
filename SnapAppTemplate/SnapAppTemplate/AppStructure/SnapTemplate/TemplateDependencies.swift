//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies
import SnapTemplate
import SnapTemplateSettings

public enum TemplateDependencies {
	
	public static func registerDependencies() {
		
		// MARK: - Template Dependencies
		
		Dependencies.register(type: Navigator.self) { Navigator(provider: AppNavigationProvider()) }
		
		
		// MARK: - TemplateShared Dependencies
		
		TemplateSharedDependencies.registerDependencies()
		Dependencies.register(type: TemplateSettingsNavigator.self) { TemplateSettingsNavigationTranslator() }
		
	}
	
}
