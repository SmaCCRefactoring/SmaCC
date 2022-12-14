"
I scan Gherkin files

I have three states: lineBegin, inRow, default
"
Class {
	#name : #CucumberScanner,
	#superclass : #SmaCCScanner,
	#category : 'SmaCC-Cucumber'
}

{ #category : #private }
CucumberScanner >> backgroundStart [
	self state: #default.
	^ self createTokenFor: outputStream contents
]

{ #category : #generated }
CucumberScanner >> emptySymbolTokenId [
	^ 36
]

{ #category : #private }
CucumberScanner >> eol [
	self state: #lineBegin.
	^ self whitespace
]

{ #category : #private }
CucumberScanner >> eol1 [
	self state: #lineBegin.
	^ self whitespace
]

{ #category : #private }
CucumberScanner >> eol2 [
	self state: #lineBegin.
	^ self whitespace
]

{ #category : #generated }
CucumberScanner >> errorTokenId [
	^ 37
]

{ #category : #private }
CucumberScanner >> examplesStart [
	self state: #default.
	^ self createTokenFor: outputStream contents
]

{ #category : #private }
CucumberScanner >> featureStart [
	self state: #default.
	^ self createTokenFor: outputStream contents
]

{ #category : #initialize }
CucumberScanner >> initialize [
	super initialize.
	state := #lineBegin
]

{ #category : #private }
CucumberScanner >> line1 [
	matchActions first: self lineId.
	^ self createTokenFor: outputStream contents
]

{ #category : #private }
CucumberScanner >> noKeyword [
	self state: #default.
	stream position: start.
	^ self next
]

{ #category : #private }
CucumberScanner >> rowStart [
	self state: #inRow.
	^ self createTokenFor: outputStream contents
]

{ #category : #generated }
CucumberScanner >> scan1 [
	self recordMatch: #(15).
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(15) ].
	^ self reportLastMatch
]

{ #category : #generated }
CucumberScanner >> scan10 [
	self step.
	currentCharacter = $n
		ifTrue: [ ^ self scan11 ].
	^ self reportLastMatch
]

{ #category : #generated }
CucumberScanner >> scan11 [
	self step.
	currentCharacter = $d
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	^ self reportLastMatch
]

{ #category : #generated }
CucumberScanner >> scan12 [
	self step.
	currentCharacter = $a
		ifTrue: [ ^ self scan13 ].
	currentCharacter = $u
		ifTrue: [ ^ self scan14 ].
	^ self reportLastMatch
]

{ #category : #generated }
CucumberScanner >> scan13 [
	self step.
	currentCharacter = $c
		ifTrue: [ 
			self step.
			currentCharacter = $k
				ifTrue: [ 
					self step.
					currentCharacter = $g
						ifTrue: [ 
							self step.
							currentCharacter = $r
								ifTrue: [ 
									self step.
									currentCharacter = $o
										ifTrue: [ 
											self step.
											currentCharacter = $u
												ifTrue: [ 
													self step.
													currentCharacter = $n
														ifTrue: [ 
															self step.
															currentCharacter = $d
																ifTrue: [ 
																	self step.
																	currentCharacter = $:
																		ifTrue: [ ^ self recordAndReportMatch: #(7) ] ] ] ] ] ] ] ] ].
	^ self reportLastMatch
]

{ #category : #generated }
CucumberScanner >> scan14 [
	self step.
	currentCharacter = $t
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	^ self reportLastMatch
]

{ #category : #generated }
CucumberScanner >> scan15 [
	self step.
	currentCharacter = $x
		ifTrue: [ ^ self scan16 ].
	^ self reportLastMatch
]

{ #category : #generated }
CucumberScanner >> scan16 [
	self step.
	currentCharacter = $a
		ifTrue: [ 
			self step.
			currentCharacter = $m
				ifTrue: [ 
					self step.
					currentCharacter = $p
						ifTrue: [ 
							self step.
							currentCharacter = $l
								ifTrue: [ 
									self step.
									currentCharacter = $e
										ifTrue: [ 
											self step.
											currentCharacter = $s
												ifTrue: [ 
													self step.
													currentCharacter = $:
														ifTrue: [ ^ self recordAndReportMatch: #(4) ] ] ] ] ] ] ].
	^ self reportLastMatch
]

{ #category : #generated }
CucumberScanner >> scan17 [
	self step.
	currentCharacter = $e
		ifTrue: [ ^ self scan18 ].
	^ self reportLastMatch
]

{ #category : #generated }
CucumberScanner >> scan18 [
	self step.
	currentCharacter = $a
		ifTrue: [ 
			self step.
			currentCharacter = $t
				ifTrue: [ 
					self step.
					currentCharacter = $u
						ifTrue: [ 
							self step.
							currentCharacter = $r
								ifTrue: [ 
									self step.
									currentCharacter = $e
										ifTrue: [ 
											self step.
											currentCharacter = $:
												ifTrue: [ ^ self recordAndReportMatch: #(6) ] ] ] ] ] ].
	^ self reportLastMatch
]

{ #category : #generated }
CucumberScanner >> scan19 [
	self step.
	currentCharacter = $i
		ifTrue: [ ^ self scan20 ].
	^ self reportLastMatch
]

{ #category : #generated }
CucumberScanner >> scan2 [
	self recordMatch: #(12).
	self step.
	currentCharacter = $"
		ifTrue: [ 
			self recordMatch: #(12).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan3 ] ].
	(currentCharacter <= Character tab
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $!) or: [ currentCharacter >= $# ] ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(12).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
CucumberScanner >> scan20 [
	self step.
	currentCharacter = $v
		ifTrue: [ ^ self scan21 ].
	^ self reportLastMatch
]

{ #category : #generated }
CucumberScanner >> scan21 [
	self step.
	currentCharacter = $e
		ifTrue: [ 
			self step.
			currentCharacter = $n
				ifTrue: [ ^ self recordAndReportMatch: #(2) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
CucumberScanner >> scan22 [
	self step.
	currentCharacter = $c
		ifTrue: [ ^ self scan23 ].
	^ self reportLastMatch
]

{ #category : #generated }
CucumberScanner >> scan23 [
	self step.
	currentCharacter = $e
		ifTrue: [ 
			self step.
			currentCharacter = $n
				ifTrue: [ 
					self step.
					currentCharacter = $a
						ifTrue: [ 
							self step.
							currentCharacter = $r
								ifTrue: [ 
									self step.
									currentCharacter = $i
										ifTrue: [ 
											self step.
											currentCharacter = $o
												ifTrue: [ 
													self step.
													currentCharacter = Character space
														ifTrue: [ 
															self step.
															currentCharacter = $O
																ifTrue: [ 
																	self step.
																	currentCharacter = $u
																		ifTrue: [ 
																			self step.
																			currentCharacter = $t
																				ifTrue: [ 
																					self step.
																					currentCharacter = $l
																						ifTrue: [ 
																							self step.
																							currentCharacter = $i
																								ifTrue: [ 
																									self step.
																									currentCharacter = $n
																										ifTrue: [ 
																											self step.
																											currentCharacter = $e
																												ifTrue: [ 
																													self step.
																													currentCharacter = $:
																														ifTrue: [ ^ self recordAndReportMatch: #(5) ] ] ] ] ] ] ] ].
															^ self reportLastMatch ].
													currentCharacter = $:
														ifTrue: [ ^ self recordAndReportMatch: #(3) ] ] ] ] ] ] ].
	^ self reportLastMatch
]

{ #category : #generated }
CucumberScanner >> scan24 [
	self step.
	currentCharacter = $h
		ifTrue: [ ^ self scan21 ].
	^ self reportLastMatch
]

{ #category : #generated }
CucumberScanner >> scan3 [
	[ 
	self recordMatch: #(12).
	self step.
	currentCharacter = $"
		ifTrue: [ 
			self recordMatch: #(12).
			self step.
			currentCharacter = $"
				ifTrue: [ 
					self recordMatch: #(12).
					self step.
					currentCharacter = $"
						ifTrue: [ ^ self scan5 ] ].
			(currentCharacter = Character lf or: [ currentCharacter = Character cr ])
				ifTrue: [ ^ self scan4 ].
			^ self scan3 ].
	(currentCharacter = Character lf or: [ currentCharacter = Character cr ])
		ifTrue: [ ^ self scan4 ] ] repeat
]

{ #category : #generated }
CucumberScanner >> scan4 [
	[ 
	self step.
	currentCharacter = $"
		ifTrue: [ 
			self step.
			currentCharacter = $"
				ifTrue: [ 
					self step.
					currentCharacter = $"
						ifTrue: [ ^ self recordAndReportMatch: #(1) ] ].
			^ self scan4 ] ] repeat
]

{ #category : #generated }
CucumberScanner >> scan5 [
	self recordMatch: #(1 12).
	self step.
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(12).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
CucumberScanner >> scan6 [
	self recordMatch: #(12).
	self step.
	currentCharacter = $`
		ifTrue: [ 
			self recordMatch: #(12).
			self step.
			currentCharacter = $`
				ifTrue: [ ^ self scan7 ] ].
	(currentCharacter <= Character tab
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $_) or: [ currentCharacter >= $a ] ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(12).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
CucumberScanner >> scan7 [
	[ 
	self recordMatch: #(12).
	self step.
	currentCharacter = $`
		ifTrue: [ 
			self recordMatch: #(12).
			self step.
			currentCharacter = $`
				ifTrue: [ 
					self recordMatch: #(12).
					self step.
					currentCharacter = $`
						ifTrue: [ ^ self scan5 ] ].
			(currentCharacter = Character lf or: [ currentCharacter = Character cr ])
				ifTrue: [ ^ self scan8 ].
			^ self scan7 ].
	(currentCharacter = Character lf or: [ currentCharacter = Character cr ])
		ifTrue: [ ^ self scan8 ] ] repeat
]

{ #category : #generated }
CucumberScanner >> scan8 [
	[ 
	self step.
	currentCharacter = $`
		ifTrue: [ 
			self step.
			currentCharacter = $`
				ifTrue: [ 
					self step.
					currentCharacter = $`
						ifTrue: [ ^ self recordAndReportMatch: #(1) ] ].
			^ self scan8 ] ] repeat
]

{ #category : #generated }
CucumberScanner >> scan9 [
	self step.
	currentCharacter = $#
		ifTrue: [ 
			self recordMatch: #(10 11).
			self step.
			(currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(10).
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $@
		ifTrue: [ ^ self recordAndReportMatch: #(9 11) ].
	currentCharacter = $A
		ifTrue: [ 
			self recordMatch: #(11).
			self step.
			currentCharacter = $n
				ifTrue: [ ^ self scan11 ].
			^ self reportLastMatch ].
	currentCharacter = $B
		ifTrue: [ 
			self recordMatch: #(11).
			self step.
			currentCharacter = $a
				ifTrue: [ ^ self scan13 ].
			currentCharacter = $u
				ifTrue: [ ^ self scan14 ].
			^ self reportLastMatch ].
	currentCharacter = $E
		ifTrue: [ 
			self recordMatch: #(11).
			self step.
			currentCharacter = $x
				ifTrue: [ ^ self scan16 ].
			^ self reportLastMatch ].
	currentCharacter = $F
		ifTrue: [ 
			self recordMatch: #(11).
			self step.
			currentCharacter = $e
				ifTrue: [ ^ self scan18 ].
			^ self reportLastMatch ].
	currentCharacter = $G
		ifTrue: [ 
			self recordMatch: #(11).
			self step.
			currentCharacter = $i
				ifTrue: [ ^ self scan20 ].
			^ self reportLastMatch ].
	currentCharacter = $S
		ifTrue: [ 
			self recordMatch: #(11).
			self step.
			currentCharacter = $c
				ifTrue: [ ^ self scan23 ].
			^ self reportLastMatch ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(8 11) ].
	(currentCharacter = Character tab or: [ currentCharacter = Character space ])
		ifTrue: [ 
			self recordMatch: #(11).
			self step.
			currentCharacter = $#
				ifTrue: [ 
					[ 
					self recordMatch: #(10).
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
						whileTrue.
					^ self reportLastMatch ].
			currentCharacter = $@
				ifTrue: [ ^ self recordAndReportMatch: #(9) ].
			currentCharacter = $A
				ifTrue: [ ^ self scan10 ].
			currentCharacter = $B
				ifTrue: [ ^ self scan12 ].
			currentCharacter = $E
				ifTrue: [ ^ self scan15 ].
			currentCharacter = $F
				ifTrue: [ ^ self scan17 ].
			currentCharacter = $G
				ifTrue: [ ^ self scan19 ].
			currentCharacter = $S
				ifTrue: [ ^ self scan22 ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(8) ].
			(currentCharacter = Character tab or: [ currentCharacter = Character space ])
				ifTrue: [ 
					[ 
					self step.
					currentCharacter = $#
						ifTrue: [ 
							[ 
							self recordMatch: #(10).
							self step.
							currentCharacter <= Character tab
								or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
								whileTrue.
							^ self reportLastMatch ].
					currentCharacter = $@
						ifTrue: [ ^ self recordAndReportMatch: #(9) ].
					currentCharacter = $A
						ifTrue: [ ^ self scan10 ].
					currentCharacter = $B
						ifTrue: [ ^ self scan12 ].
					currentCharacter = $E
						ifTrue: [ ^ self scan15 ].
					currentCharacter = $F
						ifTrue: [ ^ self scan17 ].
					currentCharacter = $G
						ifTrue: [ ^ self scan19 ].
					currentCharacter = $S
						ifTrue: [ ^ self scan22 ].
					currentCharacter = $|
						ifTrue: [ ^ self recordAndReportMatch: #(8) ].
					currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue ].
			('TW' includes: currentCharacter)
				ifTrue: [ ^ self scan24 ].
			^ self reportLastMatch ].
	('TW' includes: currentCharacter)
		ifTrue: [ 
			self recordMatch: #(11).
			self step.
			currentCharacter = $h
				ifTrue: [ ^ self scan21 ].
			^ self reportLastMatch ].
	^ self recordAndReportMatch: #(11)
]

{ #category : #generated }
CucumberScanner >> scanForToken [
	state == #inRow
		ifTrue: [ 
			[ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(14) ].
			currentCharacter = Character cr
				ifTrue: [ 
					self recordMatch: #(14).
					self step.
					currentCharacter = Character lf
						ifTrue: [ ^ self recordAndReportMatch: #(14) ].
					^ self reportLastMatch ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(13) ].
			currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue.
			true
				ifTrue: [ 
					[ 
					self step.
					currentCharacter = $|
						ifTrue: [ ^ self recordAndReportMatch: #(13) ].
					currentCharacter <= Character tab
						or: [ 
							(currentCharacter between: Character pageUp and: Character newPage)
								or: [ (currentCharacter between: (Character value: 14) and: ${) or: [ currentCharacter >= $} ] ] ] ] whileTrue ].
			^ self reportLastMatch ].
	state == #lineBegin
		ifTrue: [ ^ self scan9 ].
	state == #default
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(15) ].
			currentCharacter = Character cr
				ifTrue: [ ^ self scan1 ].
			currentCharacter = $"
				ifTrue: [ ^ self scan2 ].
			currentCharacter = $`
				ifTrue: [ ^ self scan6 ].
			(currentCharacter = Character tab or: [ currentCharacter = Character space ])
				ifTrue: [ 
					[ 
					self recordMatch: #(12).
					self step.
					currentCharacter = Character lf
						ifTrue: [ ^ self recordAndReportMatch: #(15) ].
					currentCharacter = Character cr
						ifTrue: [ ^ self scan1 ].
					currentCharacter = $"
						ifTrue: [ ^ self scan2 ].
					currentCharacter = $`
						ifTrue: [ ^ self scan6 ].
					currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue ].
			true
				ifTrue: [ 
					[ 
					self recordMatch: #(12).
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
						whileTrue ] ].
	^ self reportLastMatch
]

{ #category : #private }
CucumberScanner >> scenarioOutlineStart [
	self state: #default.
	^ self createTokenFor: outputStream contents
]

{ #category : #private }
CucumberScanner >> scenarioStart [
	self state: #default.
	^ self createTokenFor: outputStream contents
]

{ #category : #private }
CucumberScanner >> stepStart [
	self state: #default.
	^ self createTokenFor: outputStream contents
]

{ #category : #private }
CucumberScanner >> tagStart [
	self state: #default.
	^ self createTokenFor: outputStream contents
]

{ #category : #generated }
CucumberScanner >> tokenActions [
	^ #(nil #stepStart #scenarioStart #examplesStart #scenarioOutlineStart #featureStart #backgroundStart #rowStart #tagStart #comment #noKeyword nil nil #eol2 #eol)
]
