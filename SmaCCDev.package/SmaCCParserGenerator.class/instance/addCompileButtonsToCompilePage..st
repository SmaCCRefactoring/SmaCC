initialize-release
addCompileButtonsToCompilePage: aCompilePage 
	| aLALRButton aLR1Button | 
	aLALRButton := PluggableButtonMorph
				on: self
				getState: nil
				action: #compileLALR1.
	aLALRButton label: 'Compile LALR(1)';
		onColor: self defaultBackgroundColor offColor: self defaultBackgroundColor lighter;
		 position: 10 @ 140.
	aCompilePage addMorph: aLALRButton.
	aLR1Button := PluggableButtonMorph
				on: self
				getState: nil
				action: #compileLR1.
	aLR1Button label: 'Compile LR(1)';
		onColor: self defaultBackgroundColor offColor: self defaultBackgroundColor lighter;
		 position: 150 @ 140.
	aCompilePage addMorph: aLR1Button