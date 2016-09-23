copying
shallowCopy
	| copy |
	copy := self class new.
	copy action: action.
	^ copy