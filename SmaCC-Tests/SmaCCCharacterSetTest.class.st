Class {
	#name : #SmaCCCharacterSetTest,
	#superclass : #SmaCCBitCollectionTest,
	#category : 'SmaCC-Tests'
}

{ #category : #private }
SmaCCCharacterSetTest >> newCollection [
	^ SmaCCCharacterSet new
]

{ #category : #private }
SmaCCCharacterSetTest >> supportsLargeValues [
	[ Character value: 1000 ]
		on: Error
		do: [ :ex | ^ false ].
	^ true
]

{ #category : #private }
SmaCCCharacterSetTest >> value: anInteger [
	^ Character
		value:
			(self supportsLargeValues
				ifTrue: [ anInteger ]
				ifFalse: [ anInteger bitAnd: 16rFF ])
]
