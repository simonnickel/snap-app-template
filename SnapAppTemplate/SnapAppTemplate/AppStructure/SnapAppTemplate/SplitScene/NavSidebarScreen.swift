//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme
import SnapTemplateShared

struct NavSidebarScreen: View {
	
	@Environment(\.appState) private var appState
	@Environment(\.theme) private var theme
	
	let sections: [AppDestination]
	@Binding var selection: AppDestination?
	
	let isCollapsed: Bool
	
	var body: some View {
		ThemeScreenSidebar(selection: $selection, collapsed: isCollapsed) {
			ForEach(sections) { section in
				Section {
					
					ForEach(section.subItems) { item in
						NavRow(
							value: item,
							title: item.title,
							icon: item.icon,
							inSidebar: !isCollapsed,
							isSelected: selection == item
						)
					}
					
				} header: {
					
					if let title = section.title {
						ThemeLabel(
							text: title,
							/*icon: section.icon,*/
							style: .themeSidebarSectionHeader()
						)
					}
					
				}
			}
		}
#if !os(macOS) // macOS settings are available in the application menu.
		.toolbar {
			ToolbarItemGroup(placement: .bottomBar) {
				HStack {
					ToolbarButtonSettings()
						.buttonStyle(.themeSidebarBottom)
					Spacer()
				}
			}
		}
#endif
	}
	
}


// MARK: - Preview

#Preview {
	
	@Previewable @State var selection: AppDestination? = .rectangle
	@Previewable @State var visibility: NavigationSplitViewVisibility = .all
	
	return NavigationSplitView(columnVisibility: $visibility) {
		
		NavSidebarScreen(sections: AppDestination.sidebarSections, selection: $selection, isCollapsed: true)
		
	} detail: {
		
		Text("Detail")
		
	}
	.environment(\.theme, .baseApp)
	
}
