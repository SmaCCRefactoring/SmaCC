"
I am the description of a SmaCCToken instance in the inspector. I just provide a better text by reusing parser information on the symbol names, not changing anything about the inspected token.

The EyeInspector framework is very cool...
"
Class {
	#name : #AltSmaCCTokenDescription,
	#superclass : #Object,
	#instVars : [
		'start',
		'value',
		'ids'
	],
	#category : 'SmaCC-Alt'
}

{ #category : #'instance creation' }
AltSmaCCTokenDescription class >> on: aSmaCCToken in: aSmaCCParser [
	^ self new
		start: aSmaCCToken startPosition;
		value: aSmaCCToken value;
		ids:
			(aSmaCCToken ids
				collect: [ :i | 
					i > 0
						ifTrue: [ aSmaCCParser symbolNames at: i ]
						ifFalse: [ 'unknown token' ] ]);
		yourself
]

{ #category : #accessing }
AltSmaCCTokenDescription >> ids [
	^ ids
]

{ #category : #accessing }
AltSmaCCTokenDescription >> ids: anObject [
	ids := anObject
]

{ #category : #printing }
AltSmaCCTokenDescription >> printOn: s [
	s nextPutAll: start printString.
	s
		nextPutAll: ': ';
		nextPutAll: value;
		nextPutAll: ' ('.
	ids do: [ :e | s nextPutAll: e ] separatedBy: [ s nextPutAll: ', ' ].
	s nextPut: $)
]

{ #category : #accessing }
AltSmaCCTokenDescription >> start [
	^ start
]

{ #category : #accessing }
AltSmaCCTokenDescription >> start: anObject [
	start := anObject
]

{ #category : #accessing }
AltSmaCCTokenDescription >> value [
	^ value
]

{ #category : #accessing }
AltSmaCCTokenDescription >> value: anObject [
	value := anObject
]
