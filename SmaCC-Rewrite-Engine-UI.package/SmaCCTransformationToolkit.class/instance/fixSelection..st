private
fixSelection: anArray
	"Hack around the selection bug that may return an array or the single item"

	^ anArray isString
		ifTrue: [ Array with: anArray ]
		ifFalse: [ anArray ]