initialize-release
addCompileButtonsToCompilePage: aCompilePage
	aCompilePage
		addMorph:
			(AlignmentMorph newRow
				addMorph:
						((PluggableButtonMorph on: self getState: nil action: #compileLALR1)
								label: 'Compile LALR(1)';
								onColor: self defaultBackgroundColor offColor: self defaultBackgroundColor lighter;
								hResizing: #spaceFill);
				addMorph:
						((PluggableButtonMorph on: self getState: nil action: #compileLR1)
								label: 'Compile LR(1)';
								onColor: self defaultBackgroundColor offColor: self defaultBackgroundColor lighter;
								hResizing: #spaceFill);
				color: Color transparent;
				vResizing: #shrinkWrap;
				yourself)