"
The model for the code panes in the SmaCC GUI
"
Class {
	#name : #SmaCCCodeHolder,
	#superclass : #Model,
	#instVars : [
		'contents',
		'contentsMorph',
		'owner',
		'ownerAcceptSelector'
	],
	#category : 'SmaCC-Development-UI'
}

{ #category : #'instance creation' }
SmaCCCodeHolder class >> owner: aSmaCCParserGenerator [ 
	^ self owner: aSmaCCParserGenerator ownerAcceptSelector: nil
]

{ #category : #'instance creation' }
SmaCCCodeHolder class >> owner: aSmaCCParserGenerator ownerAcceptSelector: aSymbol [ 
	^ self new owner: aSmaCCParserGenerator ownerAcceptSelector: aSymbol 
]

{ #category : #'edit flag' }
SmaCCCodeHolder >> clearUserEditFlag [
	"Clear the hasUnacceptedEdits flag in all my dependent views."

	self changed: #clearUserEdits
]

{ #category : #accessing }
SmaCCCodeHolder >> contents [
	^ contents
]

{ #category : #accessing }
SmaCCCodeHolder >> contents: anObject [
	contents := anObject
]

{ #category : #menus }
SmaCCCodeHolder >> contents: aStringOrText notifying: aRequestor [
	| result |
	self ownerAcceptSelector notNil
		ifTrue: [ result := self owner perform: self ownerAcceptSelector with: aStringOrText with: aRequestor ]
		ifFalse: [ result := true ].
	result
		ifTrue: [ 
			self contents: aStringOrText.
			^ true ].
	^ false
]

{ #category : #menus }
SmaCCCodeHolder >> contentsMenu: aMenu shifted: shifted [
	^aMenu addList: #(
		('find...(f)' find)
		('find again (g)' findAgain)
		('set search string (h)' setSearchString)
		-
		('do again (j)' again)
		('undo (z)' undo)
		-
		('copy (c)' copy)
		('cut (x)' cut)
		('paste (v)' paste)
		('paste...' pasteRecent)
		-
		('accept (s)' accept)
		('cancel (l)' cancel)
		-
		('browse versions' versions)
		('save contents in file...' saveContentsInFile)
		('read contents from file...' readContentsFromFile) )
		

]

{ #category : #accessing }
SmaCCCodeHolder >> contentsMorph [
	contentsMorph isNil
		ifTrue: [ 
			contentsMorph := PluggableTextMorph
				on: self
				text: #contents
				accept: #contents:notifying:
				readSelection: nil
				menu: #contentsMenu:shifted: ].
	^ contentsMorph
]

{ #category : #'edit flag' }
SmaCCCodeHolder >> hasUnacceptedEdits [
	^ self contentsMorph hasUnacceptedEdits
]

{ #category : #initialization }
SmaCCCodeHolder >> initialize [
	"Initialize the state of the receiver with its default contents."

	super initialize.
	contents := ''
]

{ #category : #'edit flag' }
SmaCCCodeHolder >> okToChange [
	^ super okToChange
]

{ #category : #accessing }
SmaCCCodeHolder >> owner [
	^ owner
]

{ #category : #accessing }
SmaCCCodeHolder >> owner: anObject [
	owner := anObject
]

{ #category : #accessing }
SmaCCCodeHolder >> owner: aSmaCCParserGenerator ownerAcceptSelector: aSymbol [
	self owner: aSmaCCParserGenerator.
	self ownerAcceptSelector: aSymbol
]

{ #category : #accessing }
SmaCCCodeHolder >> ownerAcceptSelector [
	^ ownerAcceptSelector
]

{ #category : #accessing }
SmaCCCodeHolder >> ownerAcceptSelector: anObject [
	ownerAcceptSelector := anObject
]

{ #category : #menus }
SmaCCCodeHolder >> perform: selector orSendTo: otherTarget [
	"Selector was just chosen from a menu by a user. If can respond, 
	then perform it on myself. If not, send it to otherTarget,  
	presumably the editPane from which the menu was invoked."

	(self respondsTo: selector)
		ifTrue: [ ^ self perform: selector ]
		ifFalse: [ ^ otherTarget perform: selector ]
]

{ #category : #menus }
SmaCCCodeHolder >> readContentsFromFile [
	| result |
	(result := UITheme current
		fileOpenIn: World
		title: 'Choose file to open'
		extensions: nil
		path: FileSystem workingDirectory
		preview: nil)
		ifNotNil: [ self contents: result contents.
			self changed: #contents ]
]

{ #category : #menus }
SmaCCCodeHolder >> saveContentsInFile [
	| result |
	(result := UITheme current
		fileSaveIn: World
		title: 'Choose file to open' translated
		extensions: nil
		path: FileSystem workingDirectory)
		ifNotNil: [ result asFileReference exists
				ifTrue: [ ^ UIManager default inform: ' ' , result , ' already exists ' ].
			result asFileReference
				writeStreamDo: [ :s | s nextPutAll: contents ].
			self changed: #contents ]
]

{ #category : #menus }
SmaCCCodeHolder >> versions [
	owner grammarVersions
]
