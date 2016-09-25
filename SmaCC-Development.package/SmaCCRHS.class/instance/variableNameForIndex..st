private
variableNameForIndex: anInteger
	variableNameMap
		keysAndValuesDo: [ :key :value | 
			(value includes: anInteger)
				ifTrue: [ ^ key ] ].
	^ nil