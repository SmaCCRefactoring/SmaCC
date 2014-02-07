initialize-release
addCheckBoxesToCompilePage: aCompilePage
	| cMorph |
	cMorph := AlignmentMorph newColumn
		vResizing: #shrinkWrap;
		 hResizing: #shrinkWrap;
		 layoutInset: 1;
		 wrapCentering: #center;
		 cellPositioning: #leftCenter;
		color: Color transparent;
		 yourself.
	#(
		#(#toggleIgnoreCase #ignoreCase 'Ignore Case')
		#(#toggleIsGLR #isGLR 'Set GLR mode')
	)
		withIndexDo: [ :each :index | 
			| checkbox |
			checkbox := self theme
				newCheckboxIn: World
				for: self
				getSelected: each second
				setSelected: each first
				getEnabled: nil
				label: each third
				help: nil.
			cMorph addMorph: checkbox ].
	aCompilePage addMorph: cMorph