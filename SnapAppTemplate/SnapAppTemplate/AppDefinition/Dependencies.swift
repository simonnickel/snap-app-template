//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies

extension Dependencies {
	
	var dataSource: DataSource { DataSource() }
	
}


// MARK: - DependencyForwardingFactory

/// Allows to provide an implementation for a dependency that is defined in a package.
/// Define KeyPath in a package:
/// ```
/// var service: Service { Dependencies.forwarding(for: \.service) }
/// ```
/// Provide implementation below.
extension Dependencies: @retroactive DependencyForwardingFactory {
	
	public func create<Dependency>(for keyPath: KeyPath<Dependencies, Dependency>) -> Dependency? {
		switch keyPath {
			
			/// KeyPath `\.service` is defined in package, Implementation `Service()` is in project.
			// case \.service: Service() as? Dependency
				
			default: nil

		}
	}
	
}
