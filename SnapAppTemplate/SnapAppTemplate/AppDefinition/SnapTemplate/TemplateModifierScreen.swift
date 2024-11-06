//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

extension View {
	
	func templateSetupScreen() -> some View {
		modifier(TemplateModifierScreen())
	}
	
}

internal struct TemplateModifierScreen : ViewModifier {
	
	internal func body(content: Content) -> some View {
		content
			.templateSetupSettingsNavigator()
	}
	
}
