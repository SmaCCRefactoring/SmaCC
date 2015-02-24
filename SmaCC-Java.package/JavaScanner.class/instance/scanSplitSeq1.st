generated
scanSplitSeq1
	currentCharacter = $=
		ifTrue: [ 
			self recordMatch: #(2).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(59) ].
			^ self reportLastMatch ].
	currentCharacter = $>
		ifTrue: [ 
			self recordMatch: #(95).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(55) ].
			currentCharacter = $>
				ifTrue: [ 
					self recordMatch: #(96).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(64) ].
					currentCharacter = $>
						ifTrue: [ 
							self recordMatch: #(97).
							self step.
							currentCharacter = $=
								ifTrue: [ ^ self recordAndReportMatch: #(63) ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $?
		ifTrue: [ ^ self recordAndReportMatch: #(54) ].
	currentCharacter = $@
		ifTrue: [ ^ self recordAndReportMatch: #(13) ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter = $^
		ifTrue: [ 
			self recordMatch: #(51).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(62) ].
			^ self reportLastMatch ].
	currentCharacter = $`
		ifTrue: [ ^ self scan9 ].
	currentCharacter = ${
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter = $|
		ifTrue: [ 
			self recordMatch: #(49).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(65) ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(53) ].
			^ self reportLastMatch ].
	currentCharacter = $}
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter = $~
		ifTrue: [ ^ self recordAndReportMatch: #(87) ].
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(98).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan4 ].
			currentCharacter isDigit ] whileTrue.
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan5 ].
			('Ll' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(98) ].
			('DFdf' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(99) ].
			^ self reportLastMatch ].
	(currentCharacter isSeparator or: [ currentCharacter = Character pageUp ])
		ifTrue: [ 
			[ 
			self recordMatch: #(105).
			self step.
			currentCharacter isSeparator or: [ currentCharacter = Character pageUp ] ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ 
			[ 
			self recordMatch: #(104).
			self step.
			currentCharacter = $$
				or: [ 
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ]
				whileTrue ].
	^ self reportLastMatch