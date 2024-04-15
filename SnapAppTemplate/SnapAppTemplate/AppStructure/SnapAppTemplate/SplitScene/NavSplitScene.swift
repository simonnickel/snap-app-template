//
//  NavSplitScene.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 31.08.23.
//

import SwiftUI
import SnapTheme
import SnapTemplateShared

struct NavSplitScene: View {
	
	@Environment(\.templateStateBinding) private var templateStateBinding
	
	let sections: [NavItem]
	
	@State private var selectedInSidebar: NavItem? = NavItem.initial.subItems.first
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
					AnyView(NavItem.navigationStack(root: selected, for: .split))
				} else {
					ThemeEmptyDecorationView(text: "Select something in the sidebar.")
				}

			}
		)
		
	}
	
}
