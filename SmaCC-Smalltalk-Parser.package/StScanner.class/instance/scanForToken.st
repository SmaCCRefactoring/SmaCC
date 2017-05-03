generated
scanForToken
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scanForTokenX4 ].
	currentCharacter == $#
		ifTrue: [ ^ self recordAndReportMatch: #(1 32) ].
	currentCharacter == $$
		ifTrue: [ ^ self scanForTokenX11 ].
	currentCharacter == $'
		ifTrue: [ ^ self scanForTokenX10 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(10 32) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(4 32) ].
	currentCharacter == $-
		ifTrue: [ ^ self scanForTokenX3 ].
	currentCharacter == $.
		ifTrue: [ ^ self recordAndReportMatch: #(5 32) ].
	currentCharacter == $:
		ifTrue: [ ^ self scanForTokenX5 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(2 32) ].
	currentCharacter == $<
		ifTrue: [ ^ self scanForTokenX9 ].
	^ self scanForTokenX12