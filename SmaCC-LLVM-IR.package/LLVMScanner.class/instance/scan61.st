generated
scan61
	self step.
	currentCharacter = $0
		ifTrue: [ 
			self step.
			currentCharacter = $x
				ifTrue: [ 
					self step.
					currentCharacter isHexDigit
						ifTrue: [ 
							[ 
							self recordMatch: #(248).
							self step.
							currentCharacter isHexDigit ] whileTrue ] ].
			^ self reportLastMatch ].
	currentCharacter = $d
		ifTrue: [ 
			self step.
			currentCharacter = $i
				ifTrue: [ 
					self step.
					currentCharacter = $v
						ifTrue: [ ^ self recordAndReportMatch: #(112) ] ].
			^ self reportLastMatch ].
	currentCharacter = $e
		ifTrue: [ 
			self step.
			currentCharacter = $q
				ifTrue: [ ^ self recordAndReportMatch: #(242) ].
			^ self reportLastMatch ].
	currentCharacter = $g
		ifTrue: [ 
			self step.
			currentCharacter = $e
				ifTrue: [ ^ self recordAndReportMatch: #(208) ].
			currentCharacter = $t
				ifTrue: [ ^ self recordAndReportMatch: #(194) ].
			^ self reportLastMatch ].
	currentCharacter = $i
		ifTrue: [ 
			self step.
			currentCharacter = $t
				ifTrue: [ 
					self step.
					currentCharacter = $o
						ifTrue: [ 
							self step.
							currentCharacter = $f
								ifTrue: [ 
									self step.
									currentCharacter = $p
										ifTrue: [ ^ self recordAndReportMatch: #(186) ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $l
		ifTrue: [ 
			self step.
			currentCharacter = $e
				ifTrue: [ ^ self recordAndReportMatch: #(221) ].
			currentCharacter = $t
				ifTrue: [ ^ self recordAndReportMatch: #(216) ].
			^ self reportLastMatch ].
	currentCharacter = $m
		ifTrue: [ 
			self step.
			currentCharacter = $a
				ifTrue: [ 
					self step.
					currentCharacter = $x
						ifTrue: [ ^ self recordAndReportMatch: #(211) ].
					^ self reportLastMatch ].
			currentCharacter = $i
				ifTrue: [ 
					self step.
					currentCharacter = $n
						ifTrue: [ ^ self recordAndReportMatch: #(210) ] ].
			^ self reportLastMatch ].
	currentCharacter = $n
		ifTrue: [ ^ self scan62 ].
	currentCharacter = $r
		ifTrue: [ 
			self step.
			currentCharacter = $e
				ifTrue: [ 
					self step.
					currentCharacter = $m
						ifTrue: [ ^ self recordAndReportMatch: #(105) ] ].
			^ self reportLastMatch ].
	currentCharacter = $w
		ifTrue: [ 
			self step.
			currentCharacter = $t
				ifTrue: [ 
					self step.
					currentCharacter = $a
						ifTrue: [ 
							self step.
							currentCharacter = $b
								ifTrue: [ 
									self step.
									currentCharacter = $l
										ifTrue: [ 
											self step.
											currentCharacter = $e
												ifTrue: [ ^ self recordAndReportMatch: #(49) ] ] ] ] ] ].
	^ self reportLastMatch