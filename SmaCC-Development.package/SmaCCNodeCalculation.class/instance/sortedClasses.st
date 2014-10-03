private
sortedClasses
	^ classes ifNil: [ classes := grammar classDefinitions asSortedCollection: [ :a :b | a isSortedBefore: b ] ]