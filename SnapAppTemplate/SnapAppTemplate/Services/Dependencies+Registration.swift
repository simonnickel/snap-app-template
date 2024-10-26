//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies
import SnapSettingsService
import SnapTemplateShared
import SnapNavigation

extension Dependencies: @retroactive DependencyRegistration {
	
	public func registerDependencies() {
		Dependencies.register(type: Navigator.self) { Navigator(provider: AppNavigationProvider()) }
		TemplateDependencies.registerDependencies()

		Dependencies.register(type: DataSource.self) { DataSource() }
		
	}
	
}
