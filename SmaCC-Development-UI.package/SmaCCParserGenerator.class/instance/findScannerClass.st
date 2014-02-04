actions
findScannerClass
	| className |
	className := self
		choose: 'What class do you want to use?'
		from: (SmaCCScanner allSubclasses collect: [ :c | c name ]) asSortedCollection.
	className notNil
		ifTrue: [ 
			scannerClassMorph
				newContents: '';
				newContents: className.
			scannerClassMorph changed: #updateWindowLabel ]