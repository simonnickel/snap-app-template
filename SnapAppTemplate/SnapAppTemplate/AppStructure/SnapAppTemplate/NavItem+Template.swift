//
//  NavItem+Extension.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 19.09.23.
//

import SwiftUI
import SnapTheme
import SnapMatchingNavigation

/// Additions to NavItem that are used by the Template itself. Separated for easier updating.
extension NavItem {
	
	
	// MARK: MNavItem
	
	var tabItem: any View {
		ThemeTabItem(text: title, icon: icon)
	}
	
	var idDefault: String {
		String(reflecting: self).split(by: ["."]).last ?? ""
	}
	
	
	// MARK: - Destination
	// destination() -> NavigationModeWrapper() -> destination(for:) -> destinationBase(for:) -> NavItemDestinationWrapper()
	
	func destination() -> any View {
		return NavigationModeWrapper(navItem: self)
	}
	
	struct NavigationModeWrapper: View {
		
		@Environment(\.navigationMode) private var navigationMode
		
		let navItem: NavItem
		
		var body: some View {
			AnyView(navItem.destination(for: navigationMode))
		}
		
	}
	
	func destinationBase(for mode: MNavContainer.Mode) -> any View {
		let destination = NavItemDestinationWrapper(navItem: self)
			.environment(\.navigationMode, mode)
			.if(unwrap: title, transform: { view, title in
				view.navigationTitle(title)
			})
		
		return switch mode {
				
			case .tab: destination
#if !os(macOS)
					.if(NavItem.tabsAvailable.contains(self)) { view in
						view.toolbar {
							ToolbarItem(placement: .topBarLeading) {
								ToolbarButtonSettings()
									.buttonStyle(.themeNavbar)
							}
						}
					}
#endif
				
			case .split: destination
				
		}
	}
	
	/// Attention: If it has a single subitem, its destination is displayed directly, be careful when checking for self in `destination(for:)`, the single subitem will never go through it.
	func destinationDefault() -> any View {
		if subItems.count > 1 {
			NavTabSceneList(tab: self)
		} else if subItems.count == 1, let item = subItems.first {
			item.destination()
		} else {
			Text("No sub items defined.")
		}
	}
	
	
	// MARK: - Navigation Stack
	
	@MainActor
	static func navigationStack(root: NavItem, for mode: MNavContainer.Mode) -> any View {
		NavigationStack {
			
			AnyView(root.destination(for: mode))
				.navigationDestination(for: NavItem.self) { scene in
					AnyView(scene.destination(for: mode))
				}
			
		}
	}
	
}
