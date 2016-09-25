actions
findScannerClass
	| className |
	className := self
		choose: 'What class do you want to use?'
		from: (SmaCCScanner allSubclasses collect: [ :c | c name ]) asSortedCollection.
	className notNil
		ifTrue: [ 
			| class |
			scannerClassMorph
				newContents: '';
				newContents: className.
			scannerClassMorph changed: #updateWindowLabel.
			class := Smalltalk at: className asSymbol ifAbsent: [ ^ self ].
			self setPackage: class package name ]