*smacc-debugging-roassal
layout: aView from: aNode position: aPoint
	| element bottom nextLeft horizontalGap verticalGap position |
	horizontalGap := 20.
	verticalGap := 3.
	element := aView elementFromModel: aNode.
	nextLeft := aPoint x + element width + horizontalGap.
	bottom := aPoint y.
	aNode followed notNil
		ifTrue: [ bottom := (self layout: aView from: aNode followed position: nextLeft @ bottom) + verticalGap ].
	(aNode directLinks asSortedCollection: [ :a :b | a name < b name ]) do: [ :each | bottom := (self layout: aView from: each position: nextLeft @ bottom) + verticalGap ].
	bottom = aPoint y
		ifTrue: [ bottom := bottom + element height + verticalGap ].
	bottom := bottom - verticalGap.
	bottom := bottom max: aPoint y + element height.
	position := aPoint x @ ((bottom + aPoint y) / 2 - (element height / 2)).
	(Smalltalk at: #RTLayoutTranslator) default translateTopLeftOf: element to: position.
	^ bottom