generated
scanSplitSeq1
	currentCharacter = $@
		ifTrue: [ ^ self recordAndReportMatch: #(23) ].
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
						ifTrue: [ ^ self recordAndReportMatch: #(79) ] ].
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
	currentCharacter = ${
		ifTrue: [ ^ self recordAndReportMatch: #(85) ].
	currentCharacter = $|
		ifTrue: [ 
			self recordMatch: #(40).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(29) ].
			^ self reportLastMatch ].
	currentCharacter = $}
		ifTrue: [ ^ self recordAndReportMatch: #(86) ].
	currentCharacter = $~
		ifTrue: [ ^ self recordAndReportMatch: #(49) ].
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(73).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan10 ].
			currentCharacter isDigit ] whileTrue.
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan11 ].
			('Ljl' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(73) ].
			^ self reportLastMatch ].
	(currentCharacter = Character tab or: [ currentCharacter = Character space ])
		ifTrue: [ 
			[ 
			self recordMatch: #(79).
			self step.
			currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue.
			^ self reportLastMatch ].
	('Rr' includes: currentCharacter)
		ifTrue: [ ^ self scan14 ].
	('BUbu' includes: currentCharacter)
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan2 ].
			currentCharacter = $'
				ifTrue: [ ^ self scan6 ].
			('Rr' includes: currentCharacter)
				ifTrue: [ ^ self scan14 ].
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Q)
						or: [ 
							(currentCharacter between: $S and: $Z)
								or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $q) or: [ currentCharacter between: $s and: $z ] ] ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(71).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isSafeForHTTP
		ifTrue: [ 
			[ 
			self recordMatch: #(71).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch