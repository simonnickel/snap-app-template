//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies

extension Dependencies: @retroactive DependencyRegistration {
	
	public func registerDependencies() {
		
		// Register dependencies from Template.
		TemplateAppDependencies.registerDependencies()

		
		// MARK: - App Dependencies
		
		Dependencies.register(type: DataSource.self) { DataSource() }
		
	}
	
}
