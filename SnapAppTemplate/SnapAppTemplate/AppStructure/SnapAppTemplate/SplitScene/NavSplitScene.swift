//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme
import SnapTemplateShared

struct NavSplitScene: View {
	
	@Environment(\.templateStateBinding) private var templateStateBinding
	@EnvironmentObject private var destinationFactory: AppDestinationFactory
	
	let sections: [AppDestination]
	
	@State private var selectedInSidebar: AppDestination? = AppDestination.initial.subItems.first
	@State private var preferredCompactColumn: NavigationSplitViewColumn = .content
	@State private var isCollapsed: Bool = false

	var body: some View {
		
		SnapNavigationSplitView(
			columnVisibility: templateStateBinding.navigationSplitSidebarVisibility,
			preferredCompactColumn: $preferredCompactColumn,
			isCollapsed: $isCollapsed,
			sidebar: {
				
				NavSidebarScreen(sections: sections, selection: $selectedInSidebar, isCollapsed: isCollapsed)
				
			// }, content: {
				
			}, detail: {
				
				if let selected = selectedInSidebar {
					TemplateNavigationStack(factory: destinationFactory, root: selected, mode: .split)
				} else {
					ThemeEmptyDecorationView(text: "Select something in the sidebar.")
				}

			}
		)
		
	}
	
}
