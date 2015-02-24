generated
scanSplitSeq1
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(53) ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(58).
			self step.
			currentCharacter = $<
				ifTrue: [ 
					self recordMatch: #(3).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(128) ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(8) ].
			^ self reportLastMatch ].
	currentCharacter = $=
		ifTrue: [ 
			self recordMatch: #(43).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(14) ].
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(28) ].
			^ self reportLastMatch ].
	currentCharacter = $>
		ifTrue: [ 
			self recordMatch: #(151).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(7) ].
			currentCharacter = $>
				ifTrue: [ 
					self recordMatch: #(152).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(122) ] ].
			^ self reportLastMatch ].
	currentCharacter = $?
		ifTrue: [ 
			self recordMatch: #(74).
			self step.
			currentCharacter = $?
				ifTrue: [ ^ self recordAndReportMatch: #(35) ].
			^ self reportLastMatch ].
	currentCharacter = $@
		ifTrue: [ 
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan12 ].
			(currentCharacter isLetter or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(154).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(66) ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(62) ].
	currentCharacter = $^
		ifTrue: [ 
			self recordMatch: #(29).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(118) ].
			^ self reportLastMatch ].
	currentCharacter = $`
		ifTrue: [ ^ self scan13 ].
	currentCharacter = ${
		ifTrue: [ ^ self recordAndReportMatch: #(51) ].
	currentCharacter = $|
		ifTrue: [ 
			self recordMatch: #(32).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(115) ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(36) ].
			^ self reportLastMatch ].
	currentCharacter = $}
		ifTrue: [ ^ self recordAndReportMatch: #(50) ].
	currentCharacter = $~
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan9 ].
	(currentCharacter isSeparator or: [ currentCharacter = Character pageUp ])
		ifTrue: [ 
			[ 
			self recordMatch: #(160).
			self step.
			currentCharacter isSeparator or: [ currentCharacter = Character pageUp ] ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isLetter or: [ currentCharacter isSafeForHTTP ])
		ifTrue: [ 
			[ 
			self recordMatch: #(154).
			self step.
			currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
	^ self reportLastMatch