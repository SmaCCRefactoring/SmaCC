private
sortedClasses
	^grammar classDefinitions asSortedCollection: [:a :b | a isSortedBefore: b]