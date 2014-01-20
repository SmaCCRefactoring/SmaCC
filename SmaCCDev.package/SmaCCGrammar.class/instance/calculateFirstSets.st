private
calculateFirstSets
	| changed |
	changed := true.
	[changed] whileTrue: 
			[changed := false.
			self symbols 
				do: [:each | changed := changed | each calculateFirstTerminals]]