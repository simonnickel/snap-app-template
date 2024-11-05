//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

internal struct TemplateSidebarModifier : ViewModifier {
	
	internal func body(content: Content) -> some View {
		content
			.setupTemplateSettingsNavigator()
	}
	
}
