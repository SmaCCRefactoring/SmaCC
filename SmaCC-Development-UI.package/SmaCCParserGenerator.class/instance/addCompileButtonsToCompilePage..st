initialize-release
addCompileButtonsToCompilePage: aCompilePage
	aCompilePage
		addMorph:
			((PluggableButtonMorph on: self getState: nil action: #compileLALR1)
				label: 'Compile LALR(1)';
				onColor: self defaultBackgroundColor offColor: self defaultBackgroundColor lighter;
				position: 10 @ 160).
	aCompilePage
		addMorph:
			((PluggableButtonMorph on: self getState: nil action: #compileLR1)
				label: 'Compile LR(1)';
				onColor: self defaultBackgroundColor offColor: self defaultBackgroundColor lighter;
				position: 150 @ 160)