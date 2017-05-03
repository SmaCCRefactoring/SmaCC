accessing
addDirectLinkToNodeNamed: aString state: anInteger
	| node |
	(followed notNil and: [ followed name = aString ])
		ifTrue: [ ^ followed ].
	directLinks
		do: [ :each | 
			each name = aString
				ifTrue: [ ^ each ] ].
	node := self class named: aString state: anInteger parser: parser.
	node addPrevious: self.
	^ directLinks add: node