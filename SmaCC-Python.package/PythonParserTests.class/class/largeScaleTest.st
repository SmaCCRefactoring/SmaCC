as yet unclassified
largeScaleTest
	" self largeScaleTest inspect "

	| failures |
	failures := OrderedCollection new: 100.
	self pythonDirectoriesOnDamienLaptop
		do: [ :dir | 
			(self allPythonFilesIn: dir)
				do: [ :pyfile | 
					[ self parse: pyfile reference ]
						on: SmaCCParserError
						do: [ :err | failures add: err ] ] ].
	^ failures