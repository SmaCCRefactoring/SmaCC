actions
updateScannerClass: className
	| class |
	self updateTitle.
	class := Smalltalk at: className asSymbol ifAbsent: [ ^ self ].
	self setPackage: class package name