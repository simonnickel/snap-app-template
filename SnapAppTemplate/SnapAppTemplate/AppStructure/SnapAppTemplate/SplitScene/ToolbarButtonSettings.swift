//
//  ToolbarButtonSettings.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 28.09.23.
//

import SwiftUI
import SnapCore
import SnapTheme
import SnapTemplateShared

struct ToolbarButtonSettings: View {
	
	@Environment(\.templateStateBinding) private var templateStateBinding
	
	var body: some View {
		
		Button {
			templateStateBinding.showSettings.wrappedValue.toggle()
		} label: {
			ThemeLabel(
				text: "Settings",
				icon: .settings
			)
		}

	}
}
