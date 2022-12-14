Class {
	#name : #DelphiCommentParser,
	#superclass : #DelphiParser,
	#category : 'SmaCC-Delphi'
}

{ #category : #public }
DelphiCommentParser >> parse [
	| node |
	[ scanner next ids first = self emptySymbolTokenId ] whileFalse.
	node := SmaCCParseNode new.
	node comments: scanner comments.
	^ node
]
