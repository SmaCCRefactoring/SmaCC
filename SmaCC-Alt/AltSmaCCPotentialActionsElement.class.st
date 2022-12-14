"
I represent the list of potential actions
"
Class {
	#name : #AltSmaCCPotentialActionsElement,
	#superclass : #AltAbstractEyeElement,
	#category : 'SmaCC-Alt'
}

{ #category : #private }
AltSmaCCPotentialActionsElement >> actionLabelFor: anInteger [
	| type |
	type := anInteger bitAnd: host actionMask.
	type = host acceptAction
		ifTrue: [ ^ 'Accept' ].
	type = host shiftAction
		ifTrue: [ ^ 'Shift' ].
	type = host reduceAction
		ifTrue: [ ^ self reduceActionName: (anInteger bitShift: -2) ].
	^ 'Multiple'
]

{ #category : #private }
AltSmaCCPotentialActionsElement >> actionsAndSymbolsForState: stateIndex do: aBlock [
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
AltSmaCCPotentialActionsElement >> label [
	^ 'possible actions'
]

{ #category : #private }
AltSmaCCPotentialActionsElement >> reduceActionName: anInteger [
	| entry |
	entry := host reduceTable at: anInteger.
	^ 'Reduce(' , (entry at: 2) printString , ') as '
		, (host symbolNames at: entry first ifAbsent: [ '?' ])
]

{ #category : #accessing }
AltSmaCCPotentialActionsElement >> value [
	| items |
	items := OrderedCollection new.
	self
		actionsAndSymbolsForState: host stateStack last
		do: [ :action :symbol | 
			items
				add:
					(host symbolNames at: symbol ifAbsent: [ '? ' ])
						-> (self actionLabelFor: action) ].
	^ items
]
