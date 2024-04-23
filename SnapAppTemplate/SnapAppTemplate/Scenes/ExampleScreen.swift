//
//  ExampleScreen.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 04.09.23.
//

import SwiftUI
import SnapTheme

struct ExampleScreen: View {
	
	@Environment(\.theme) private var theme
	@Environment(\.dataSource) private var dataSource
	
	let item: NavItem
	
	var body: some View {
		
		ThemeScene {
			
			VStack {
				
				Text(dataSource.content)
				
				Button(action: {}, label: {
					ThemeLabel(text: "Button", style: .themeButtonPrimary)
				})
				.buttonStyle(.themePrimary)
				
			}
	
		}
		
	}
	
}


// MARK - Preview

#Preview {
	
	NavigationStack {
		
		ExampleScreen(item: .rectangleA)
		
	}
	
}
