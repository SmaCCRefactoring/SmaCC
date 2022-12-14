"
I execute a step until the next reduce action in the debugging session
"
Class {
	#name : #AltSmaCCStepToNextReduce,
	#superclass : #Object,
	#instVars : [
		'debugger'
	],
	#category : 'SmaCC-Alt'
}

{ #category : #'instance creation' }
AltSmaCCStepToNextReduce class >> on: anAltDebugger [
	^ self new debugger: anAltDebugger
]

{ #category : #accessing }
AltSmaCCStepToNextReduce >> debugger [
	^ debugger
]

{ #category : #accessing }
AltSmaCCStepToNextReduce >> debugger: anObject [
	debugger := anObject
]

{ #category : #accessing }
AltSmaCCStepToNextReduce >> execute [
	| selectors |
	selectors := debugger currentContext receiver reduceTable
		inject: Set new
		into: [ :sum :each | 
			sum
				add: each last;
				yourself ].
	self
		stepUntil: [ :context | 
			(context
				findContextSuchThat: [ :each | 
					(each receiver isKindOf: SmaCCParser)
						and: [ selectors includes: each selector ] ]) notNil ]
]

{ #category : #private }
AltSmaCCStepToNextReduce >> stepUntil: aBlock [
	[ aBlock value: debugger currentContext ]
		whileFalse: [ debugger session stepInto: debugger currentContext.
			debugger updateSession ].
	debugger updateSession
]
