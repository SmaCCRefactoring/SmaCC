"
I represent a translated state stack element for a parser
"
Class {
	#name : #AltSmaCCStateStackElement,
	#superclass : #AltAbstractEyeElement,
	#category : 'SmaCC-Alt'
}

{ #category : #private }
AltSmaCCStateStackElement >> actionsAndSymbolsFor: aByteArray do: aBlock [
	"This method contains the code for uncompiling the compression format used by the table."

	| action |
	(aByteArray at: 1) = 0
		ifTrue: [ action := ((aByteArray at: 2) bitShift: 8) + (aByteArray at: 3).
			4 to: aByteArray size by: 2 do: [ :i | 
				aBlock
					value: action
					value: ((aByteArray at: i) bitShift: 8) + (aByteArray at: i + 1) ] ]
		ifFalse: [ 2 to: aByteArray size by: 4 do: [ :i | 
				aBlock
					value: ((aByteArray at: i) bitShift: 8) + (aByteArray at: i + 1)
					value: ((aByteArray at: i + 2) bitShift: 8) + (aByteArray at: i + 3) ] ]
]

{ #category : #private }
AltSmaCCStateStackElement >> actionsAndSymbolsForState: stateIndex do: aBlock [
	| action bytes |
	bytes := host transitionTable at: stateIndex.
	(bytes at: 1) = 0
		ifTrue: [ action := ((bytes at: 2) bitShift: 8) + (bytes at: 3).
			4 to: bytes size by: 2 do: [ :i | 
				aBlock
					value: action
					value: ((bytes at: i) bitShift: 8) + (bytes at: i + 1) ] ]
		ifFalse: [ 2 to: bytes size by: 4 do: [ :i | 
				aBlock
					value: ((bytes at: i) bitShift: 8) + (bytes at: i + 1)
					value: ((bytes at: i + 2) bitShift: 8) + (bytes at: i + 3) ] ]
]

{ #category : #accessing }
AltSmaCCStateStackElement >> label [
	^ 'state stack'
]

{ #category : #private }
AltSmaCCStateStackElement >> symbolForTransitionFrom: fromState to: toState [
	| id |
	id := self symbolIdForTransitionFrom: fromState to: toState.
	^ host symbolNames at: id ifAbsent: [ '?' ]
]

{ #category : #private }
AltSmaCCStateStackElement >> symbolIdForTransitionFrom: fromState to: toState [
	| parser toValue |
	parser := host.
	toValue := (toState bitShift: 2) bitOr: parser shiftAction.
	self
		actionsAndSymbolsForState: fromState
		do: [ :action :symbol | 
			| row |
			toValue = action
				ifTrue: [ ^ symbol ].
			(action bitAnd: parser actionMask) = 2r11
				ifTrue: [ row := parser ambiguousTransitions at: (action bitShift: -2).
					1 to: row size by: 2 do: [ :i | 
						((row at: i) bitShift: 8) + (row at: i + 1) = toValue
							ifTrue: [ ^ symbol ] ] ] ].
	^ 0
]

{ #category : #accessing }
AltSmaCCStateStackElement >> value [
	| states |
	states := host stateStack.
	^ (Array with: 'start: ' , states first printString)
		,
			((1 to: states size - 1)
				collect:
					[ :i | self symbolForTransitionFrom: (states at: i) to: (states at: i + 1) ])
]
