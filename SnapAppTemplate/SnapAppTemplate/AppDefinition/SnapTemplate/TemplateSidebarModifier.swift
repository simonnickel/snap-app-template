//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

internal struct TemplateSidebarModifier : ViewModifier {

	@Environment(Navigator.self) private var navigator
	
	internal func body(content: Content) -> some View {
		content
			.environment(\.navigatorSettings, TemplateSettingsDestinationTranslator(navigator: navigator))
	}
	
}
