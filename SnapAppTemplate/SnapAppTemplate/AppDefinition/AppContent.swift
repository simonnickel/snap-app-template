//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies
import SnapTemplate
import SwiftUI

/// A container to apply app specific customisation to the content.
struct AppContent: View {
	
	@Dependency(\.navigator) private var navigator

	var body: some View {
	
		TemplateContent(navigator: navigator)
		
	}
	
}
