initialize-release
addCompileButtonsToCompilePage: aCompilePage
	aCompilePage
		addMorph:
			(AlignmentMorph newRow
				addMorph:
					((PluggableButtonMorph on: self getState: nil action: #compileLALR1)
						label: 'Compile LALR(1)';
						onColor: self defaultBackgroundColor
							offColor: self defaultBackgroundColor lighter;
						hResizing: #spaceFill);
				addMorph:
					((PluggableButtonMorph on: self getState: nil action: #compileLR1)
						label: 'Compile LR(1)';
						onColor: self defaultBackgroundColor
							offColor: self defaultBackgroundColor lighter;
						hResizing: #spaceFill);
				addMorph:
					((PluggableButtonMorph on: self getState: nil action: #grammarVersions)
						label: 'Versions';
						onColor: self defaultBackgroundColor
							offColor: self defaultBackgroundColor lighter;
						hResizing: #spaceFill);
				addMorph:
					((PluggableButtonMorph on: self getState: nil action: #loadFromFile)
						label: 'Load from...';
						onColor: self defaultBackgroundColor
							offColor: self defaultBackgroundColor lighter;
						hResizing: #spaceFill);
				addMorph:
					((PluggableButtonMorph on: self getState: nil action: #saveToFile)
						label: 'Save to...';
						onColor: self defaultBackgroundColor
							offColor: self defaultBackgroundColor lighter;
						hResizing: #spaceFill);
				addMorph:
					((PluggableButtonMorph on: self getState: nil action: #accept)
						label: 'Save';
						onColor: self defaultBackgroundColor
							offColor: self defaultBackgroundColor lighter;
						hResizing: #spaceFill);
				layoutInset: 0;
				vResizing: #shrinkWrap;
				yourself)