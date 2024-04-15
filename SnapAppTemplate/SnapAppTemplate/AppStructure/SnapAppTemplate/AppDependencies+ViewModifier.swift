//
//  AppDependencies+ViewModifier.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 21.10.23.
//

import SwiftUI

extension View {
	
	func apply(_ dependencies: AppDependencies) -> some View {
		return self.modifier(AppDependencyModifier(dependencies: dependencies))
	}
	
}

private struct AppDependencyModifier: ViewModifier {
	
	let dependencies: AppDependencies
	
	public func body(content: Content) -> some View {
		return dependencies.apply(on: content)
	}
	
}
