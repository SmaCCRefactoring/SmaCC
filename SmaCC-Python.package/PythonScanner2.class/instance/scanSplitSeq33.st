generated
scanSplitSeq33
	currentCharacter = $@
		ifTrue: [ ^ self recordAndReportMatch: #(23) ].
	currentCharacter = $R
		ifTrue: [ ^ self scan13 ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(83) ].
	currentCharacter = $\
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(79) ].
			currentCharacter = Character cr
				ifTrue: [ 
					self recordMatch: #(79).
					self step.
					currentCharacter = Character lf
						ifTrue: [ ^ self recordAndReportMatch: #(79) ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(84) ].
	currentCharacter = $^
		ifTrue: [ 
			self recordMatch: #(37).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(34) ].
			^ self reportLastMatch ].
	currentCharacter = $`
		ifTrue: [ ^ self recordAndReportMatch: #(46) ].
	currentCharacter = $a
		ifTrue: [ ^ self scanSplit16 ].
	currentCharacter = $b
		ifTrue: [ ^ self scanSplit30 ].
	currentCharacter = $c
		ifTrue: [ ^ self scanSplit20 ].
	currentCharacter = $d
		ifTrue: [ ^ self scanSplit3 ].
	currentCharacter = $e
		ifTrue: [ ^ self scanSplit29 ].
	currentCharacter = $f
		ifTrue: [ ^ self scanSplit23 ].
	currentCharacter = $g
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $l
				ifTrue: [ ^ self scanSplit2 ].
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Z)
						or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $k) or: [ currentCharacter between: $m and: $z ] ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(71).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue.
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $i
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $f
				ifTrue: [ 
					self recordMatch: #(59 71).
					self step.
					((currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
						ifTrue: [ 
							[ 
							self recordMatch: #(71).
							self step.
							(currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
								whileTrue.
							^ self reportLastMatch ].
					^ self reportLastMatch ].
			^ self scanSplitSeq32 ].
	currentCharacter = $l
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $a
				ifTrue: [ ^ self scanSplit1 ].
			((currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $b and: $z ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(71).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue.
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	^ self scanSplitSeq31