testing
isEnabled
	| interval |
	interval := requestor textSelectionInterval ifNil: [ ^ false ].
	^ (target text copyFrom: interval first to: interval last) isEmpty not