"
I represent the contents of a parser, with a transition table and a reduce action table
"
Class {
	#name : #SmaCCRParseTable,
	#superclass : #Object,
	#instVars : [
		'transitions',
		'reduces',
		'symbols',
		'decode'
	],
	#category : 'SmaCC-Development-Debug'
}

{ #category : #'instance creation' }
SmaCCRParseTable class >> for: aParser [
	^ self new
		symbols: aParser symbolNames;
		reduces: aParser reduceTable;
		transitions: aParser transitionTable
]

{ #category : #accessing }
SmaCCRParseTable >> decode [
	^ decode
]

{ #category : #accessing }
SmaCCRParseTable >> decode: anObject [
	decode := anObject
]

{ #category : #accessing }
SmaCCRParseTable >> reduces [
	^ reduces
]

{ #category : #accessing }
SmaCCRParseTable >> reduces: anObject [
	reduces := anObject
]

{ #category : #accessing }
SmaCCRParseTable >> symbols [
	^ symbols
]

{ #category : #accessing }
SmaCCRParseTable >> symbols: anObject [
	symbols := anObject
]

{ #category : #accessing }
SmaCCRParseTable >> transitions [
	^ transitions
]

{ #category : #accessing }
SmaCCRParseTable >> transitions: aTable [
	"When I set that object, I decode the table."

	transitions := aTable.
	decode := aTable
		collect: [ :l | 
			l first == 0
				ifTrue: [ (4 to: l size by: 2)
						collect: [ :i | 
							SmaCCRTransition
								onAction: (l second << 8) + l third
								for: ((l at: i) << 8) + (l at: i + 1)
								in: self ] ]
				ifFalse: [ (4 to: l size by: 4)
						collect: [ :i | 
							SmaCCRTransition
								onAction: ((l at: i - 2) << 8) + (l at: i - 1)
								for: ((l at: i) << 8) + (l at: i + 1)
								in: self ] ] ]
]
