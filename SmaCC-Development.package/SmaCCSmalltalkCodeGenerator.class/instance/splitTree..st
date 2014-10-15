private
splitTree: aTree
	"This is where we create sub-methods."

	"We have here a fairly complex code which tries to split sequence nodes. At the moment, this code has not been proven as being of interest, is complex and may not be correct."

	"This code generates methods with names such as scanSplitX (normal scan approach) and scanSplitSeqX (splitting inside sequences). Some improvement may be to look at how to split more efficiently in sequences."

	"Do one split, then return."

	| targets oldSplitIndex szMax |
	szMax := 0.
	targets := aTree allChildren
		select: [ :e | 
			| sz |
			sz := e allChildren size.
			szMax := (sz min: self maxMethodLength) max: szMax.
			e parent notNil and: [ e parent ~= aTree and: [ e lastIsReturn and: [ sz > 20 ] ] ] ].
	targets := targets reject: [ :s | s isBlock and: [ s body lastIsReturn ] ].
	targets := targets sorted: [ :a :b | a allChildren size > b allChildren size ].
	oldSplitIndex := splitIndex.
	[ targets notEmpty and: [ oldSplitIndex = splitIndex ] ]
		whileTrue: [ 
			| current childrens |
			current := targets removeFirst.
			childrens := current allChildren.
			childrens size > self maxMethodLength
				ifTrue: [ 
					| sz |
					(current isSequence
						and: [ current temporaries isEmpty and: [ (sz := current children last allChildren size) < 1000 ] ])
						ifTrue: [ 
							| j currentChild currentCopy oldSz |
							j := current children size.
							[ sz < self maxMethodLength and: [ j > 1 ] ]
								whileTrue: [ 
									j := j - 1.
									oldSz := sz.
									sz := sz + (current children at: j) allChildren size + 1 ].
							currentChild := current children at: j + 1.
							oldSz > szMax
								ifTrue: [ 
									splitIndex := splitIndex + 1.
									currentCopy := current copy.
									currentCopy statements: (currentCopy statements copyFrom: j + 1 to: currentCopy statements size).
									self compile: 'scanSplitSeq' , splitIndex printString inside: currentCopy.
									currentChild replaceWith: (RBParser parseExpression: '^ self scanSplitSeq' , splitIndex printString).
									((j + 2 to: current statements size) collect: [ :k | current statements at: k ])
										do: [ :e | current removeNode: e ] ] ] ]
				ifFalse: [ 
					splitIndex := splitIndex + 1.
					self compile: 'scanSplit' , splitIndex printString inside: current.
					current replaceWith: (RBParser parseExpression: '^ self scanSplit' , splitIndex printString) ] ].
	splitIndex = oldSplitIndex
		ifTrue: [ self error: 'unable to split!' ].
	^ aTree