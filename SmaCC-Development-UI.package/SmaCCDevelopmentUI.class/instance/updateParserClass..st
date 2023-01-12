actions
updateParserClass: className

	| class text |
	(self parserClass notNil and: [
		 self parserClass class includesSelector: #scannerClass ])
		ifTrue: [
		scannerClassMorph content: self parserClass scannerClass name ]
		ifFalse: [
			scannerClassMorph content:
				(className copyReplaceAll: 'Parser' with: 'Scanner') ].
	self updateTitle.
	class := Smalltalk at: className asSymbol ifAbsent: [ ^ self ].
	self setPackage: class package name.
	(class class includesSelector: #definitionComment)
		ifTrue: [
			text := self getCommentsFrom: class class >> #definitionComment.
			self definition: text ]
		ifFalse: [
			(class class includesSelector: #parserDefinitionComment) ifTrue: [
				| scannerText "Old style, force conversion." parserText |
				scannerText := (self scannerClass class includesSelector:
					                #scannerDefinitionComment)
					               ifTrue: [
						               self getCommentsFrom:
							               self scannerClass class
							               >> #scannerDefinitionComment ]
					               ifFalse: [ '' ].
				parserText := self getCommentsFrom:
					              class class >> #parserDefinitionComment.
				self definition:
					'#Definition extracted from old style definition comments
' , scannerText , '
' , parserText ] ]