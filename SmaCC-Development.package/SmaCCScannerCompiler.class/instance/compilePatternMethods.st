compiling-scanner
compilePatternMethods
	self tokens
		at: '<patternToken>'
		ifPresent: [ :val |
			| sentinels stream |
			sentinels := val nodes splitOn: [ :each | (each isKindOf: SmaCCRepeatingRENode) ].
			stream := ReadWriteStream on: ''.
			sentinels first do: [ :each | each putOn: stream ].
			codeGenerator compilePattern: 'Begin' with: stream contents.
			stream resetContents.
			sentinels last do: [ :each | each putOn: stream ].
			codeGenerator compilePattern: 'End' with: stream contents ]