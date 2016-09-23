*SmaCC-Debugging-Support
gtInspectorItems
	| items |
	items := OrderedCollection new.
	self class allInstVarNames
		do:
			[ :each | 
			| selector tag value |
			selector := each asSymbol.
			(value := self perform: selector) notNil
				ifTrue:
					[ tag := nil.
					((self otherVariables includes: selector) or: [ self ignoredOtherVariables includes: selector ])
						ifTrue: [ tag := #other ].
					((self nodeVariables includes: selector) or: [ self ignoredNodeVariables includes: selector ])
						ifTrue: [ tag := #node ].
					(((self compositeNodeVariables includes: selector) or: [ self ignoredCompositeNodeVariables includes: selector ])
						and: [ value notEmpty ])
						ifTrue: [ tag := #nodes ].
					((self tokenVariables includes: selector) or: [ self ignoredTokenVariables includes: selector ])
						ifTrue: [ tag := #token ].
					(((self compositeTokenVariables includes: selector) or: [ self ignoredCompositeTokenVariables includes: selector ])
						and: [ value notEmpty ])
						ifTrue: [ tag := #tokens ].
					tag notNil
						ifTrue: [ items add: (Array with: each with: tag with: value) ] ] ].
	^ items