//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies
import SnapTemplate
import SnapTemplateSettings

extension Dependencies {
		
	var navigator: Navigator { Navigator(provider: AppNavigationProvider()) }
	
}


// MARK: - DependencyForwardingFactory

extension Dependencies: @retroactive DependencyForwardingFactory {
	
	public func create<Dependency>(for keyPath: KeyPath<Dependencies, Dependency>) -> Dependency? {
		switch keyPath {
				
			case \.templateSettingsNavigator: TemplateSettingsNavigationTranslator() as? Dependency
				
			default: nil

		}
	}
	
}
