//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme

struct ExampleScreen: View {
	
	@Environment(\.theme) private var theme
	@Environment(\.dataSource) private var dataSource
	
	let item: AppDestination
	
	var body: some View {
		
		ThemeScreen {
			
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
