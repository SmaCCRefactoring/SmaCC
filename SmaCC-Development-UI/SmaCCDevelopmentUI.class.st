"
SmaCC: The Smalltalk Compiler-Compiler 
from John Brant and Don Roberts
(http://www.refactory.com/Software/SmaCC)
"
Class {
	#name : #SmaCCDevelopmentUI,
	#superclass : #Object,
	#instVars : [
		'tabList',
		'parserClassMorph',
		'scannerClassMorph',
		'packageMorph',
		'conflicts',
		'mainWindow',
		'definitionCodeHolder',
		'testCodeHolder',
		'conflictTextMorph',
		'itemsTextMorph',
		'symbolsTextMorph',
		'grammarCompiler'
	],
	#classVars : [
		'ShowPrecedenceConflicts'
	],
	#category : 'SmaCC-Development-UI'
}

{ #category : #'class initialization' }
SmaCCDevelopmentUI class >> initialize [
	ShowPrecedenceConflicts := false
]

{ #category : #'class initialization' }
SmaCCDevelopmentUI class >> menuCommandOn: aBuilder [ 
	<worldMenu> 
	(aBuilder item: #'SmaCC Parser Generator')
			parent: #Tools;
			action: [ self open ]; 
			help: 'Create and test parsers with SmaCC'.
]

{ #category : #'instance creation' }
SmaCCDevelopmentUI class >> open [
	^ self new openInWorld
]

{ #category : #actions }
SmaCCDevelopmentUI >> accept [
	definitionCodeHolder contentsMorph accept
]

{ #category : #actions }
SmaCCDevelopmentUI >> acceptDefinition: aStringOrAText notifying: aRequestor [
	^ [ self parserClass
		ifNotNil: [ | parserCompiler |
			parserCompiler := SmaCCGrammarCompiler new.
			parserCompiler
				category: self packageString;
				scannerClass: self scannerClassString;
				parserClass: self parserClassString.
			parserCompiler codeGenerator
				compileDefinitionComment: aStringOrAText asString.
			parserCompiler codeGenerator compileChanges ].
	SmaCCGrammarCompiler new buildDefinition: aStringOrAText.
	true ]
		on: SmaCCParserError
		do: [ :ex | 
			self
				displayError: ex description
				at: ex tag position
				notifying: aRequestor.
			ex return: false ]
]

{ #category : #actions }
SmaCCDevelopmentUI >> acceptTestCode: aStringOrAText notifying: aRequestor [
	| class |
	class := self parserClass.
	class isNil
		ifTrue: [ 
			UIManager default inform: 'No parser defined'.
			^ false ].
	^ self parse
]

{ #category : #initialization }
SmaCCDevelopmentUI >> addButtonsToTestPage: aTestPage [
	| aParserButton aParserInspectButton aParserDebugButton |
	aParserButton := PluggableButtonMorph
		on: self
		getState: nil
		action: #parse.
	aParserButton
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		label: 'Parse'.
	aParserInspectButton := PluggableButtonMorph
		on: self
		getState: nil
		action: #parseAndInspect.
	aParserInspectButton
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		label: 'Parse and inspect'.
	aParserDebugButton := PluggableButtonMorph
		on: self
		getState: nil
		action: #parseInDebug.
	aParserDebugButton
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		label: 'Parse in debug'.
	aTestPage
		addMorph:
			(AlignmentMorph newRow
				vResizing: #shrinkWrap;
				hResizing: #spaceFill;
				layoutInset: 0;
				addMorph: aParserButton;
				addMorph: aParserInspectButton;
				addMorph: aParserDebugButton;
				yourself)
]

{ #category : #initialization }
SmaCCDevelopmentUI >> addClassSelectorsToCompilePage: aCompilePage [
	"The scanner class hasn't got the same meaning as before, since the definition is for both scanner and parser at the same time. Left it for now, since it allows the reuse of a scanner class later on."

	| paLine |
	paLine := AlignmentMorph newRow
		color: Color transparent;
		vResizing: #shrinkWrap.
	paLine addMorphBack: 'Package:' asMorph.
	paLine addMorphBack: self buildPackageMorph.
	paLine addMorphBack: '    Scanner:' asMorph.
	paLine addMorphBack: self buildScannerClassMorph.
	paLine addMorphBack: '    Parser:' asMorph.
	paLine addMorphBack: self buildParserClassMorph.
	aCompilePage addMorph: paLine
]

{ #category : #initialization }
SmaCCDevelopmentUI >> addCompileButtonsToCompilePage: aCompilePage [
	aCompilePage
		addMorph:
			(AlignmentMorph newRow
				addMorph:
					((PluggableButtonMorph on: self getState: nil action: #compileLALR1)
						label: 'Compile LALR(1)';
						onColor: self defaultBackgroundColor
							offColor: self defaultBackgroundColor lighter;
						hResizing: #spaceFill);
				addMorph:
					((PluggableButtonMorph on: self getState: nil action: #compileLR1)
						label: 'Compile LR(1)';
						onColor: self defaultBackgroundColor
							offColor: self defaultBackgroundColor lighter;
						hResizing: #spaceFill);
				addMorph:
					((PluggableButtonMorph on: self getState: nil action: #grammarVersions)
						label: 'Versions';
						onColor: self defaultBackgroundColor
							offColor: self defaultBackgroundColor lighter;
						hResizing: #spaceFill);
				addMorph:
					((PluggableButtonMorph on: self getState: nil action: #loadFromFile)
						label: 'Load from...';
						onColor: self defaultBackgroundColor
							offColor: self defaultBackgroundColor lighter;
						hResizing: #spaceFill);
				addMorph:
					((PluggableButtonMorph on: self getState: nil action: #saveToFile)
						label: 'Save to...';
						onColor: self defaultBackgroundColor
							offColor: self defaultBackgroundColor lighter;
						hResizing: #spaceFill);
				addMorph:
					((PluggableButtonMorph on: self getState: nil action: #accept)
						label: 'Save';
						onColor: self defaultBackgroundColor
							offColor: self defaultBackgroundColor lighter;
						hResizing: #spaceFill);
				layoutInset: 0;
				vResizing: #shrinkWrap;
				yourself)
]

{ #category : #initialization }
SmaCCDevelopmentUI >> addConflictsBoxToDefinitionPage: aDefinitionPageTabPalette [
	self
		conflictTextMorph:
			((PluggableTextMorph
				on: self
				text: #conflicts
				accept: nil
				readSelection: nil
				menu: nil)
				vResizing: #spaceFill;
				hResizing: #spaceFill;
				enabled: false;
				yourself).
	aDefinitionPageTabPalette
		addPage:
			(aDefinitionPageTabPalette newContentMorph
				addMorph: self conflictTextMorph;
				yourself)
		label: 'Messages'
]

{ #category : #initialization }
SmaCCDevelopmentUI >> addItemsBoxToDefinitionPage: aDefinitionPageTabPalette [
	self
		itemsTextMorph:
			((PluggableTextMorph
				on: self
				text: #items
				accept: nil
				readSelection: nil
				menu: nil)
				vResizing: #spaceFill;
				hResizing: #spaceFill;
				enabled: false;
				yourself).
	aDefinitionPageTabPalette
		addPage:
			(aDefinitionPageTabPalette newContentMorph
				addMorph: self itemsTextMorph;
				yourself)
		label: 'Items Sets'
]

{ #category : #private }
SmaCCDevelopmentUI >> addPackage: packageName [
	"Brain dead api..."

	packageMorph updateContentMorphWith: packageName
]

{ #category : #private }
SmaCCDevelopmentUI >> addParserClass: className [
	"Brain dead api... Have to create the class here."

	parserClassMorph updateContentMorphWith: className.
	self updateParserClass: className
]

{ #category : #private }
SmaCCDevelopmentUI >> addScannerClass: className [
	"Brain dead api... Have to create the class here."

	scannerClassMorph updateContentMorphWith: className.
	self updateScannerClass: className
]

{ #category : #initialization }
SmaCCDevelopmentUI >> addSymbolsBoxToDefinitionPage: aDefinitionPageTabPalette [
	self
		symbolsTextMorph:
			((PluggableTextMorph
				on: self
				text: #symbols
				accept: nil
				readSelection: nil
				menu: nil)
				vResizing: #spaceFill;
				hResizing: #spaceFill;
				enabled: false;
				yourself).
	aDefinitionPageTabPalette
		addPage:
			(aDefinitionPageTabPalette newContentMorph
				addMorph: self symbolsTextMorph;
				yourself)
		label: 'Symbols'
]

{ #category : #initialization }
SmaCCDevelopmentUI >> addTabToDefinitionPage: aDefinitionPage [
	self tabList: (self theme newTabGroupIn: World for: #()).
	aDefinitionPage
		addMorph: self tabList
		fullFrame: (LayoutFrame new
							topFraction: 0.7 offset: 0;
							bottomFraction: 1 offset: 4).
	self
		addConflictsBoxToDefinitionPage: self tabList;
		addItemsBoxToDefinitionPage: self tabList;
		addSymbolsBoxToDefinitionPage: self tabList;
		addTestPageToDefinitionPage: self tabList
]

{ #category : #initialization }
SmaCCDevelopmentUI >> addTestPageToDefinitionPage: aDefinitionPagePalette [
	| aTestPage |
	aTestPage := AlignmentMorph newColumn
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		cellPositioning: #leftCenter;
		color: Color transparent;
		layoutInset: 0;
		yourself.
	self addButtonsToTestPage: aTestPage.
	self addTextToTestPage: aTestPage.
	aDefinitionPagePalette
		addPage:
			(aDefinitionPagePalette newContentMorph
				addMorph: aTestPage;
				yourself)
		label: 'Test'
]

{ #category : #initialization }
SmaCCDevelopmentUI >> addTextToDefinitionPage: aDefinitionPage [
	definitionCodeHolder := SmaCCCodeHolder
		owner: self
		ownerAcceptSelector: #acceptDefinition:notifying:.
	aDefinitionPage
		addMorph: definitionCodeHolder contentsMorph
		fullFrame: (LayoutFrame new bottomFraction: 0.7)
]

{ #category : #initialization }
SmaCCDevelopmentUI >> addTextToTestPage: aTestPage [
	| aTestText |
	testCodeHolder := SmaCCCodeHolder
		owner: self
		ownerAcceptSelector: #acceptTestCode:notifying:.
	aTestText := testCodeHolder contentsMorph.
	aTestText
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		color: Color transparent.
	aTestPage addMorph: aTestText
]

{ #category : #initialization }
SmaCCDevelopmentUI >> buildPackageMorph [
	^ packageMorph := (EditableDropListMorph
		on: self
		list: #packages
		selected: nil
		changeSelected: nil
		useIndex: false
		addToList: #addPackage:
		class: String
		getEnabled: nil)
		hResizing: #spaceFill;
		updateContentMorphWith: 'SmaCC-Tutorial'
]

{ #category : #initialization }
SmaCCDevelopmentUI >> buildParserClassMorph [
	^ parserClassMorph := (EditableDropListMorph
		on: self
		list: #parserClasses
		selected: nil
		changeSelected: #updateParserClass:
		useIndex: false
		addToList: #addParserClass:
		class: String
		getEnabled: nil) hResizing: #spaceFill
]

{ #category : #initialization }
SmaCCDevelopmentUI >> buildScannerClassMorph [
	^ scannerClassMorph := (EditableDropListMorph
		on: self
		list: #scannerClasses
		selected: nil
		changeSelected: #updateScannerClass:
		useIndex: false
		addToList: #addScannerClass:
		class: String
		getEnabled: nil) hResizing: #spaceFill
]

{ #category : #actions }
SmaCCDevelopmentUI >> choose: aString from: aCollection [ 
	^ UIManager default chooseOrRequestFrom: aCollection title: aString withCRs
]

{ #category : #private }
SmaCCDevelopmentUI >> compile: aSymbol [
	| aGrammar stream oldCharacterSize parserCompiler messages |
	(self scannerClassString isEmpty
		or: [ self parserClassString isEmpty ])
		ifTrue: [ ^ UIManager default inform: 'Both classes are not specified' ].
	messages := OrderedCollection new.
	Cursor read
		showWhile: [ self verifyDefinition
				ifFalse: [ ^ self ] ].
	Cursor wait
		showWhile: [ oldCharacterSize := SmaCCGrammar maximumCharacterValue.
			self ensurePackage.
			[ SmaCCGrammar maximumCharacterValue: 255.
			parserCompiler := SmaCCGrammarCompiler new.
			[ parserCompiler
				category: self packageString;
				buildDefinition: self definition;
				scannerClass: self scannerClassString;
				parserClass: self parserClassString ]
				on: SmaCCParserError
				do: [ :ex | 
					self
						displayError: ex description
						at: ex tag position
						notifying: self definitionCodeHolder contentsMorph.
					^ self ].
			aGrammar := parserCompiler grammar.
			aGrammar type: aSymbol.
			stream := WriteStream on: Text new.
			[ parserCompiler createChanges.
			parserCompiler codeGenerator compileChanges ]
				on: SmaCCCompilationNotification
				do: [ :ex | 
					(ShowPrecedenceConflicts
						or: [ ('*precedence*' match: ex messageText) not ])
						ifTrue: [ messages
								add:
									ex messageText , Character cr asString , Character cr asString
										, ex tag ].
					ex pass ].
			messages asSortedCollection
				do: [ :each | 
					stream
						nextPutAll: '-------------------------';
						cr;
						nextPutAll: each;
						cr ].
			self conflicts: stream contents.
			grammarCompiler := parserCompiler.
			self changed: #items.
			self changed: #symbols.
			self testText string trimBoth notEmpty
				ifTrue: [ self testCodeHolder contentsMorph hasUnacceptedEdits: true ] ]
				ensure: [ SmaCCGrammar maximumCharacterValue: oldCharacterSize ] ]
]

{ #category : #actions }
SmaCCDevelopmentUI >> compileLALR1 [
	self compile: #LALR1
]

{ #category : #actions }
SmaCCDevelopmentUI >> compileLR1 [
	self compile: #LR1
]

{ #category : #'accessing-ui' }
SmaCCDevelopmentUI >> conflictTextMorph [
	^ conflictTextMorph
]

{ #category : #'accessing-ui' }
SmaCCDevelopmentUI >> conflictTextMorph: anObject [
	conflictTextMorph := anObject
]

{ #category : #accessing }
SmaCCDevelopmentUI >> conflicts [
	conflicts isNil
		ifTrue: [ conflicts := String new ].
	^ conflicts
]

{ #category : #accessing }
SmaCCDevelopmentUI >> conflicts: aString [ 
	conflicts := aString.
	self changed: #conflicts
]

{ #category : #initialization }
SmaCCDevelopmentUI >> createDefinitionPage [
	| aDefinitionPage group |
	aDefinitionPage := PanelMorph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		fillStyle: Color transparent;
		changeTableLayout;
		cellInset: 0;
		cellPositioning: #leftCenter;
		yourself.	"non pane color tracking"
	self mainWindow addMorph: aDefinitionPage frame: (0 @ 0 corner: 1 @ 1).
	group := Morph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		fillStyle: Color transparent;
		changeProportionalLayout;
		yourself.	"non pane color tracking"
	self
		addTabToDefinitionPage: group;
		addTextToDefinitionPage: group.
	group
		addMorph:
			(ProportionalSplitterMorph new
				layoutFrame: (LayoutFrame new
						topFraction: 0.7 offset: 0;
						bottomFraction: 0.7 offset: 4);
				addLeftOrTop: group submorphs first;
				addRightOrBottom: group submorphs last;
				beSplitsTopAndBottom).
	aDefinitionPage addMorph: group.
	self
		addCompileButtonsToCompilePage: aDefinitionPage;
		addClassSelectorsToCompilePage: aDefinitionPage.
	self tabList selectedPageIndex: 1
]

{ #category : #initialization }
SmaCCDevelopmentUI >> createTestPage [
	| aTestPage |
	aTestPage := AlignmentMorph newColumn
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		cellPositioning: #leftCenter;
		color: Color transparent;
		yourself.
	self addButtonsToTestPage: aTestPage.
	self addTextToTestPage: aTestPage.
	self tabList
		addPage:
			(self tabList newContentMorph
				addMorph: aTestPage;
				yourself)
		label: 'Test'
]

{ #category : #colors }
SmaCCDevelopmentUI >> defaultBackgroundColor [
	^ UITheme current backgroundColor
]

{ #category : #accessing }
SmaCCDevelopmentUI >> definition [
	^ self definitionCodeHolder contents asString
]

{ #category : #accessing }
SmaCCDevelopmentUI >> definition: aString [
	self definitionCodeHolder contents: aString.
	self definitionCodeHolder contentsMorph setText: aString asText
]

{ #category : #'accessing-ui' }
SmaCCDevelopmentUI >> definitionCodeHolder [
	^definitionCodeHolder
]

{ #category : #'accessing-ui' }
SmaCCDevelopmentUI >> definitionCodeHolder: aCodeHolder [
	definitionCodeHolder := aCodeHolder
]

{ #category : #private }
SmaCCDevelopmentUI >> displayError: aString at: position notifying: aRequestor [
	aRequestor selectFrom: position to: position - 1.
	aRequestor replaceSelectionWith: (Text string: aString , '->' attribute: TextEmphasis bold).
	aRequestor setSelection: (position to: position + aString size + 1)
]

{ #category : #private }
SmaCCDevelopmentUI >> ensurePackage [
	"Make sure the package exists."

	(RPackageOrganizer default
		packageMatchingExtensionName: self packageString)
		ifNil: [ MCWorkingCopy forPackage: (MCPackage named: self packageString) ]
]

{ #category : #private }
SmaCCDevelopmentUI >> getCommentsFrom: aMethod [
	^ String
		streamContents: [ :s | aMethod ast comments do: [ :e | s nextPutAll: e contents asUncommentedCode ] ]

]

{ #category : #accessing }
SmaCCDevelopmentUI >> grammarVersions [
	"Return the list of all the versions of the current grammar, if any."

	| pC |
	pC := self parserClass ifNil: [ ^ #() ].
	(pC class includesSelector: #definitionComment)
		ifTrue: [ SmaCCVersionBrowser
				browseVersionsForMethod: pC class >> #definitionComment ]
]

{ #category : #actions }
SmaCCDevelopmentUI >> handleUpdate: aMorphChangedAnnouncement [
	^ aMorphChangedAnnouncement deliverTo: self
]

{ #category : #private }
SmaCCDevelopmentUI >> initialExtent [
	^ 650 @ 750
]

{ #category : #initialization }
SmaCCDevelopmentUI >> initialize [
	mainWindow := StandardWindow new.
	mainWindow model: self.
	mainWindow announcer when: WindowClosed send: #release to: self.
	SystemAnnouncer uniqueInstance
		when:
			ClassAdded , ClassRemoved , ClassReorganized , ClassRenamed
				, ClassModifiedClassDefinition
			send: #updateClasses
			to: self;
		when: MCWorkingCopyCreated , MCWorkingCopyDeleted
			send: #updatePackages
			to: self;
		when: MethodModified send: #updateDefinition: to: self.
	self createDefinitionPage.
	self updateTitle
]

{ #category : #accessing }
SmaCCDevelopmentUI >> items [
	grammarCompiler isNil
		ifTrue: [ ^ '' ].
	^ grammarCompiler itemSetsComment
]

{ #category : #'accessing-ui' }
SmaCCDevelopmentUI >> itemsTextMorph [
	^ itemsTextMorph
]

{ #category : #'accessing-ui' }
SmaCCDevelopmentUI >> itemsTextMorph: anObject [
	itemsTextMorph := anObject
]

{ #category : #actions }
SmaCCDevelopmentUI >> loadFromFile [
	definitionCodeHolder readContentsFromFile
]

{ #category : #'accessing-ui' }
SmaCCDevelopmentUI >> mainWindow [
	^ mainWindow
]

{ #category : #display }
SmaCCDevelopmentUI >> openInWorld [
	self mainWindow openInWorld
]

{ #category : #accessing }
SmaCCDevelopmentUI >> packageString [
	^ packageMorph content
]

{ #category : #accessing }
SmaCCDevelopmentUI >> packages [
	^ RPackageOrganizer default packageNames asSortedCollection
]

{ #category : #actions }
SmaCCDevelopmentUI >> parse [
	self
		parseAndEvaluate: [:each | ^ true].
	^ false
]

{ #category : #actions }
SmaCCDevelopmentUI >> parseAndEvaluate: aBlock [
	| class |
	self testCodeHolder contents: self testText.
	self testCodeHolder changed: #contents.
	class := self parserClass.
	class isNil
		ifTrue: [ 
			UIManager default inform: 'No parser defined'.
			^ false ]
		ifFalse: [ 
			Cursor wait
				showWhile: [ 
					aBlock
						value:
							(class
								parse: self testText asString 
								onError: [ :aString :position | 
									self displayError: aString at: position notifying: self testCodeHolder contentsMorph.
									self testCodeHolder contentsMorph hasUnacceptedEdits: true.
									self testCodeHolder contentsMorph takeKeyboardFocus.
									^ false ]) ] ].
	^ true
]

{ #category : #actions }
SmaCCDevelopmentUI >> parseAndInspect [
	^ self parseAndEvaluate: [ :each | each inspect ]
]

{ #category : #actions }
SmaCCDevelopmentUI >> parseInDebug [
	| class |
	self testCodeHolder contents: self testText.
	self testCodeHolder changed: #contents.
	class := self parserClass.
	class isNil
		ifTrue: [ UIManager default inform: 'No parser defined'.
			^ false ]
		ifFalse: [ class parseInDebug: self testText asString ].
	^ true
]

{ #category : #actions }
SmaCCDevelopmentUI >> parseNoErrorHandling [
	| class |
	self testCodeHolder contents: self testText.
	self testCodeHolder changed: #contents.
	class := self parserClass.
	class isNil
		ifTrue: [ UIManager default inform: 'No parser defined'.
			^ false ]
		ifFalse:
			[ Cursor wait showWhile: [ class parse: self testText asString ] ].
	^ true
]

{ #category : #accessing }
SmaCCDevelopmentUI >> parserClass [
	"If we have a parserClass name, but no class, this means we have not yet compiled the parser."

	| classname |
	classname := self parserClassString asSymbol.
	^ classname notEmpty
		ifTrue: [ Smalltalk at: classname ifAbsent: [  ] ]
]

{ #category : #accessing }
SmaCCDevelopmentUI >> parserClassString [
	^ parserClassMorph content
]

{ #category : #accessing }
SmaCCDevelopmentUI >> parserClasses [
	^ ((SmaCCParser allSubclasses collect: [ :c | c name ])
		reject: [ :c | c = 'SmaCCGLRParser' ]) asSortedCollection
]

{ #category : #initialization }
SmaCCDevelopmentUI >> release [
	SystemAnnouncer uniqueInstance unsubscribe: self.
	mainWindow ifNotNil: [ mainWindow announcer unsubscribe: self ].
	super release
]

{ #category : #actions }
SmaCCDevelopmentUI >> saveToFile [
	definitionCodeHolder saveContentsInFile
]

{ #category : #accessing }
SmaCCDevelopmentUI >> scannerClass [
	"If we have a parserClass name, but no class, this means we have not yet compiled the parser."

	| classname |
	classname := self scannerClassString asSymbol.
	^ classname notEmpty
		ifTrue: [ Smalltalk at: classname ifAbsent: [  ] ]
]

{ #category : #accessing }
SmaCCDevelopmentUI >> scannerClassString [
	^scannerClassMorph content
]

{ #category : #accessing }
SmaCCDevelopmentUI >> scannerClasses [
	^ (SmaCCScanner allSubclasses collect: [ :c | c name ])
		asSortedCollection
]

{ #category : #private }
SmaCCDevelopmentUI >> setPackage: aPackageName [
	aPackageName notNil
		ifTrue: [ 
			packageMorph
				content: aPackageName ]
]

{ #category : #accessing }
SmaCCDevelopmentUI >> symbols [
	grammarCompiler isNil
		ifTrue: [ ^ '' ].
	^ grammarCompiler symbolsComment
]

{ #category : #'accessing-ui' }
SmaCCDevelopmentUI >> symbolsTextMorph [
	^ symbolsTextMorph
]

{ #category : #'accessing-ui' }
SmaCCDevelopmentUI >> symbolsTextMorph: anObject [
	symbolsTextMorph := anObject
]

{ #category : #'accessing-ui' }
SmaCCDevelopmentUI >> tabList [
	^tabList
]

{ #category : #'accessing-ui' }
SmaCCDevelopmentUI >> tabList: anObject [
	tabList := anObject
]

{ #category : #'accessing-ui' }
SmaCCDevelopmentUI >> testCodeHolder [
	^testCodeHolder
]

{ #category : #'accessing-ui' }
SmaCCDevelopmentUI >> testCodeHolder: anObject [
	testCodeHolder := anObject
]

{ #category : #accessing }
SmaCCDevelopmentUI >> testText [
	^ self testCodeHolder contentsMorph text
]

{ #category : #'accessing-ui' }
SmaCCDevelopmentUI >> theme [
	^ UITheme current
]

{ #category : #actions }
SmaCCDevelopmentUI >> update: anObjectOrASymbol [ 
	(anObjectOrASymbol isKindOf: Symbol)
		ifTrue: [(self respondsTo: anObjectOrASymbol)
				ifTrue: [self perform: anObjectOrASymbol]].
	super update: anObjectOrASymbol
]

{ #category : #private }
SmaCCDevelopmentUI >> updateClasses [
	"Force an update of the classes lists."

	self changed: #scannerClasses.
	self changed: #parserClasses
]

{ #category : #private }
SmaCCDevelopmentUI >> updateDefinition: aMethodModified [
	"If our definition is updated, then we need to reset the contents of the definition. Expected use case: the user has reverted to a previous version of the grammar definition."

	(aMethodModified methodClass == self parserClass class
		and: [ aMethodModified selector == #definitionComment ])
		ifTrue: [ | text |
			text := self
				getCommentsFrom: aMethodModified methodClass >> #definitionComment.
			self definition: text ]
]

{ #category : #private }
SmaCCDevelopmentUI >> updatePackages [
	"Force an update of the packages lists."

	self changed: #packages
]

{ #category : #actions }
SmaCCDevelopmentUI >> updateParserClass: className [
	| class text |
	(self parserClass notNil
		and: [ self parserClass class includesSelector: #scannerClass ])
		ifTrue: [ scannerClassMorph content: self parserClass scannerClass name ]
		ifFalse: [ scannerClassMorph
				content: (className copyReplaceAll: 'Parser' with: 'Scanner') ].
	self updateTitle.
	class := Smalltalk at: className asSymbol ifAbsent: [ ^ self ].
	self setPackage: class package name.
	(class class includesSelector: #definitionComment)
		ifTrue: [ text := self getCommentsFrom: class class >> #definitionComment.
			self definition: text ]
		ifFalse: [ (class class includesSelector: #parserDefinitionComment)
				ifTrue: [ | scannerText	"Old style, force conversion." parserText |
					(self scannerClass class
						includesSelector: #scannerDefinitionComment)
						ifTrue: [ scannerText := self
								getCommentsFrom: self scannerClass class >> #scannerDefinitionComment ]
						ifFalse: [ scannerText := '' ].
					parserText := self
						getCommentsFrom: class class >> #parserDefinitionComment.
					self
						definition:
							'#Definition extracted from old style definition comments
' , scannerText
								,
									'
' , parserText ] ]
]

{ #category : #actions }
SmaCCDevelopmentUI >> updateScannerClass: className [
	| class |
	self updateTitle.
	class := Smalltalk at: className asSymbol ifAbsent: [ ^ self ].
	self setPackage: class package name
]

{ #category : #actions }
SmaCCDevelopmentUI >> updateTitle [
	| scannerLabel parserLabel |
	scannerLabel := self scannerClassString isEmpty
		ifFalse: [ self scannerClassString ]
		ifTrue: [ 'Undefined' ].
	parserLabel := self parserClassString isEmpty
		ifFalse: [ self parserClassString ]
		ifTrue: [ 'Undefined' ].
	^ self mainWindow
		setLabel: 'SmaCCParserGenerator: ' , scannerLabel , '/' , parserLabel
]

{ #category : #private }
SmaCCDevelopmentUI >> verifyDefinition [
	| definition |
	definition := self definitionCodeHolder contentsMorph text.
	definition string trimBoth isEmpty
		ifTrue: [ UIManager default inform: 'Empty Parser code'.
			self tabList selectedPageIndex: 1.
			^ false ].
	self definitionCodeHolder hasUnacceptedEdits
		ifTrue: [ (self
				acceptDefinition: definition
				notifying: self definitionCodeHolder contentsMorph)
				ifTrue: [ self definitionCodeHolder contents: definition.
					self definitionCodeHolder contentsMorph text = definition
						ifFalse: [ self definitionCodeHolder changed: #contents ]
						ifTrue: [ self definitionCodeHolder clearUserEditFlag ] ]
				ifFalse: [ ^ false ] ].
	^ true
]
