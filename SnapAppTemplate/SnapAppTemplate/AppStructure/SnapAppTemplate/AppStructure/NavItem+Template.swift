//
//  NavItem+Template.swift
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
	
}
