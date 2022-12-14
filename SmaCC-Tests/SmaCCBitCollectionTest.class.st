Class {
	#name : #SmaCCBitCollectionTest,
	#superclass : #TestCase,
	#category : 'SmaCC-Tests'
}

{ #category : #private }
SmaCCBitCollectionTest >> byteSizeCollection [
	^ (0 to: 255) collect: self
]

{ #category : #private }
SmaCCBitCollectionTest >> largeCollection [
	^ (1 to: 50000) collect: self
]

{ #category : #private }
SmaCCBitCollectionTest >> largeValue [
	^ 1000000
]

{ #category : #private }
SmaCCBitCollectionTest >> mediumCollection [
	^ (1 to: 1000) collect: self
]

{ #category : #private }
SmaCCBitCollectionTest >> newCollection [
	^ SmaCCIntegerSet new
]

{ #category : #private }
SmaCCBitCollectionTest >> supportsLargeValues [
	^ true
]

{ #category : #tests }
SmaCCBitCollectionTest >> testABunch [
	| collection count |
	collection := self newCollection.
	collection addAll: self byteSizeCollection.
	count := 0.
	collection do: [ :each | count := count + 1 ].
	self assert: count = 256.
	self assert: collection size = 256.
	self assert: collection notEmpty.
	self
		assert:
			(self byteSizeCollection
				allSatisfy: [ :each | collection includes: each ]).
	self assert: collection asArray = self byteSizeCollection asArray
]

{ #category : #tests }
SmaCCBitCollectionTest >> testAddToNextByte [
	| collection count |
	collection := self newCollection.
	collection add: (self value: 8).
	count := 0.
	collection do: [ :each | count := count + 1 ].
	self assert: count = 1.
	self assert: collection size = 1.
	self assert: collection notEmpty.
	self assert: (collection includes: (self value: 8)).
	self deny: (collection includes: (self value: 7)).
	self deny: (collection includes: (self value: 9))
]

{ #category : #tests }
SmaCCBitCollectionTest >> testAdding [
	| collection count |
	collection := self newCollection.
	collection add: (self value: 1).
	count := 0.
	collection do: [ :each | count := count + 1 ].
	self assert: count = 1.
	self assert: collection size = 1.
	self assert: collection notEmpty.
	self assert: (collection includes: (self value: 1)).
	self deny: (collection includes: (self value: 0)).
	self deny: (collection includes: (self value: 2))
]

{ #category : #tests }
SmaCCBitCollectionTest >> testComparing [
	| a b |
	a := self newCollection.
	a addAll: self mediumCollection.
	b := self newCollection.
	b addAll: self mediumCollection reverse.
	self assert: a hash = b hash.
	self assert: a = b.
	self supportsLargeValues
		ifFalse: [ ^ self ].
	b
		add: (self value: self largeValue);
		remove: (self value: self largeValue).
	self assert: a hash = b hash.
	self assert: a = b
]

{ #category : #tests }
SmaCCBitCollectionTest >> testCopying [
	| a b |
	a := self newCollection.
	a addAll: self mediumCollection.
	b := a copy.
	b remove: (self value: 5).
	self assert: (a includes: (self value: 5)).
	self deny: (b includes: (self value: 5))
]

{ #category : #tests }
SmaCCBitCollectionTest >> testGrowing [
	| collection count |
	collection := self newCollection.
	collection add: (self value: 256).
	count := 0.
	collection do: [ :each | count := count + 1 ].
	self assert: count = 1.
	self assert: collection size = 1.
	self assert: collection notEmpty.
	self assert: (collection includes: (self value: 256)).
	self deny: (collection includes: (self value: 1)).
	collection remove: (self value: 256).
	self deny: (collection includes: (self value: 256)).
	self assert: collection size = 0
]

{ #category : #tests }
SmaCCBitCollectionTest >> testLessThan [
	| a b |
	a := self newCollection.
	a addAll: self mediumCollection.
	b := self newCollection.
	b addAll: self mediumCollection.
	self deny: a < b.
	self deny: a > b.
	self assert: a <= b.
	self assert: a >= b.
	b remove: (self value: 1).
	self assert: a < b.
	self deny: a > b.
	self assert: a <= b.
	self deny: a >= b.
	b add: (self value: 1).
	b remove: (self value: 2).
	self assert: a < b.
	self deny: a > b.
	self assert: a <= b.
	self deny: a >= b.
	self supportsLargeValues
		ifFalse: [ ^ false ].
	b
		add: (self value: 2);
		remove: (self value: 1000).
	self deny: a < b.
	self assert: a > b.
	self deny: a <= b.
	self assert: a >= b
]

{ #category : #tests }
SmaCCBitCollectionTest >> testNew [
	self assert: self newCollection size = 0.
	self assert: self newCollection isEmpty
]

{ #category : #tests }
SmaCCBitCollectionTest >> testPerformance [
	| myTime setTime |
	myTime := Time
		millisecondsToRun: [ self newCollection addAll: self largeCollection ].
	setTime := Time
		millisecondsToRun: [ Set new addAll: self largeCollection ].
	setTime := setTime max: 1000.	"Some implementations of Set don't have performance problems"
	self assert: myTime < (setTime // 2)
]

{ #category : #tests }
SmaCCBitCollectionTest >> testRemoving [
	| collection |
	collection := self newCollection.
	collection add: (self value: 1).
	self assert: collection size = 1.
	collection remove: (self value: 1).
	self assert: collection size = 0.
	self deny: (collection includes: (self value: 1))
]

{ #category : #private }
SmaCCBitCollectionTest >> value: anInteger [
	^ anInteger
]
