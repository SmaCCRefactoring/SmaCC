private
finishBuilding
	self ignoreCase
		ifTrue:
			[ self symbols do: [ :each | each makeCaseInsensitive ].
			self mergeCaseSensitiveKeywords ].
	annotateTokens
		ifTrue:
			[ self symbols
				do: [ :each | each annotateTokenVariables: self class tokenNameBlock ] ]