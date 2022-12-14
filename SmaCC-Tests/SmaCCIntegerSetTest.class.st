Class {
	#name : #SmaCCIntegerSetTest,
	#superclass : #SmaCCBitCollectionTest,
	#category : 'SmaCC-Tests'
}

{ #category : #tests }
SmaCCIntegerSetTest >> testNegative [
	| collection |
	collection := self newCollection.
	collection add: 1.
	collection add: -1.
	collection add: -100000.
	self assert: collection size = 3.
	self assert: (collection includes: 1).
	self assert: (collection includes: -1).
	self assert: (collection includes: -100000).
	self deny: (collection includes: 0)
]
