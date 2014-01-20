generated-scanner
scanForToken
	self step.
	((currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(20).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	((currentCharacter between: Character tab and: Character cr) or: [ currentCharacter = Character space ])
		ifTrue: [ 
			[ 
			self recordMatch: #whitespace.
			self step.
			(currentCharacter between: Character tab and: Character cr) or: [ currentCharacter = Character space ] ] whileTrue.
			^ self reportLastMatch ].
	currentCharacter = $"
		ifTrue: [ ^ self scan2 ].
	currentCharacter = $#
		ifTrue: [ 
			[ 
			self recordMatch: #comment.
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	currentCharacter = $%
		ifTrue: [ ^ self scan1 ].
	currentCharacter = $'
		ifTrue: [ 
			self step.
			((currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ])
				ifTrue: [ 
					[ 
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue.
					currentCharacter = $'
						ifTrue: [ ^ self recordAndReportMatch: #(24) ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(17) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(14) ].
	currentCharacter = $*
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	currentCharacter = $+
		ifTrue: [ ^ self recordAndReportMatch: #(16) ].
	currentCharacter = $/
		ifTrue: [ 
			self step.
			currentCharacter = $*
				ifTrue: [ ^ self scan3 ].
			^ self reportLastMatch ].
	currentCharacter = $:
		ifTrue: [ 
			self recordMatch: #(25).
			self step.
			currentCharacter = $:
				ifTrue: [ 
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(25) ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter = $<
		ifTrue: [ 
			self step.
			((currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ])
				ifTrue: [ 
					[ 
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue.
					currentCharacter = $>
						ifTrue: [ ^ self recordAndReportMatch: #(19) ].
					^ self reportLastMatch ].
			currentCharacter = $%
				ifTrue: [ ^ self recordAndReportMatch: #(13) ].
			^ self reportLastMatch ].
	currentCharacter = $?
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter = ${
		ifTrue: [ 
			self step.
			currentCharacter ~= $}
				ifTrue: [ 
					[ 
					self step.
					currentCharacter ~= $} ] whileTrue.
					currentCharacter = $}
						ifTrue: [ ^ self recordAndReportMatch: #(23) ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	^ self reportLastMatch