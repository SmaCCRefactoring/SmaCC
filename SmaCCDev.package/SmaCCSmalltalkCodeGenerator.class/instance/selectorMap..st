accessing
selectorMap: aDictionary
	| arrayMap |
	aDictionary isEmpty ifTrue: [^self].
	arrayMap := Array new: aDictionary keys asSortedCollection last.
	aDictionary keysAndValuesDo: [:key :value | arrayMap at: key put: value].
	self
		startPublicOverrideMethod;
		nextPutLine: (self method: 'tokenActions' type: self collectionType);
		nextPutStatement: (self return: arrayMap storeString);
		endMethod;
		compileMethodIn: self scannerClass