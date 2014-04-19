public
examples
	| class |
	#(#CParser #JavaParser #StParser #CSharpParser)
		do: [ :each | 
			class := Smalltalk classNamed: each.
			self buildScanner: class scannerClass andParser: class ]