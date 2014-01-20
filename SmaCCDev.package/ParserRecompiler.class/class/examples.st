public
examples
	| class |
	#( CParser JavaParser StParser ) do: [ :each |
		class := Smalltalk classNamed: each.
		(self
			buildScanner: class scannerClass
			andParser: class)
				compileChanges ]