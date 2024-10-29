//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme
import SnapDependencies

struct ExampleScreen: View {
	
	@Environment(\.theme) private var theme
	@Dependency private var dataSource: DataSource
	
	let destination: AppDestination
	
	var body: some View {
		
		ThemeScreen {
			
			VStack {
				
				Text(destination.definition.title + " Screen")
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
		
		ExampleScreen(destination: .rectangleA)
		
	}
	
}
