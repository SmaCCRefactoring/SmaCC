private
componentIndex
	collection
		keysAndValuesDo:
			[:index :each | ((self variableNameForIndex: index) isNil and: [each isSubtypeOf: self]) ifTrue: [^index]].
	^0