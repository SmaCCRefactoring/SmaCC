building
scannerProperties
	| items scanner string |
	scanner := self scanner.
	items := OrderedCollection new.
	string := scanner outputStream ifNil: [ '' ] ifNotNil: [ :stream | stream contents ].
	items add: (Array with: 'State' with: scanner state).
	(self currentContext receiver isKindOf: SmaCCScanner)
		ifTrue:
			[ items
				add: (Array with: 'Current Character' with: scanner currentCharacter);
				add: (Array with: 'Start Index' with: scanner debugStart).
			string isEmpty
				ifFalse:
					[ items
						add: (Array with: 'Scan String' with: string);
						add: (Array with: 'Match String' with: (string copyFrom: 1 to: scanner lastOutputStreamMatchPosition));
						add:
							(Array
								with: 'Match Type'
								with:
									(scanner matchActions
										ifNil: [ '' ]
										ifNotNil:
											[ :symbols | 
											| stream |
											stream := WriteStream on: String new.
											symbols do: [ :each | stream nextPutAll: (self symbolLabelFor: each) ] separatedBy: [ stream space ].
											stream contents ])) ] ].
	^ items