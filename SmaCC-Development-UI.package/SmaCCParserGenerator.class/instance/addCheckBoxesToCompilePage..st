initialize-release
addCheckBoxesToCompilePage: aCompilePage
	#(
		#(#toggleIgnoreCase #ignoreCase 'Ignore Case')
		#(#toggleGenerateDefinitionComments #generateDefinitionComments 'Generate definition comments')
		#(#toggleGenerateSymbolComments #generateSymbolComments 'Generate symbol comments')
		#(#toggleGenerateItemSetComments #generateItemSetComments 'Generate item set comments')
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
			checkbox position: 10 @ 35 + (index * (0 @ 20)).
			aCompilePage addMorph: checkbox ]