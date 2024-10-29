//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme
import SnapTemplate
import SnapNavigation
import SnapDependencies

/// A container to apply app specific customisation to the content.
struct AppContent: View {

	var body: some View {
	
		TemplateContent<AppNavigationProvider>()
		
	}
	
}
