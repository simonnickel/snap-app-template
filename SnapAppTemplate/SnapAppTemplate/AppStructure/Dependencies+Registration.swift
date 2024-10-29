//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies
import SnapSettingsService
import SnapTemplate
import SnapNavigation

extension Dependencies: @retroactive DependencyRegistration {
	
	public func registerDependencies() {
		
		// Register dependencies from Template.
		TemplateDependencies.registerDependencies()

		
		// MARK: - App Dependencies
		
		Dependencies.register(type: DataSource.self) { DataSource() }
		
	}
	
}
