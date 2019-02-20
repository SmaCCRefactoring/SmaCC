initialize-release
tokenName: aString
	| node regex |
	node := grammar tokenNamed: aString.
	node isNil
		ifTrue: [ ^ self buildErrorNFA ].
	actionMap := OrderedCollection new.
	[ regex := SmaCCSequenceRENode nodes: {node regularExpression}.
	actionMap add: node.
	regex action: 1.
	node
		allNodesDo: [ :each | 
			actionMap add: each.
			each regularExpression ifNotNil: [ :re | re action: actionMap size ] ].
	nfa := regex asNFA ]
		ensure: [ grammar withAllNodesDo: [ :each | each removeAttributeNamed: #regularExpression ] ]