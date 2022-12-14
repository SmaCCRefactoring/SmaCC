"
I add special fields to a SmaCC parser if I am inspecting it (Decompilation)
"
Class {
	#name : #AltSmaCCParserInspector,
	#superclass : #AltItemInspector,
	#category : 'SmaCC-Alt'
}

{ #category : #list }
AltSmaCCParserInspector >> addInstanceVariables: elements [
	"generate the collection of elements to show in the inspector for the object inspected"

	(self object class allInstVarNames
		reject: [ :name | name = 'currentToken' or: [ name = 'errorToken' ] ])
		do: [ :name | 
			elements
				add: (AltInstanceVariableEyeElement host: self object instVarName: name) ].
	^ elements
]

{ #category : #list }
AltSmaCCParserInspector >> addSpecialFields: elements [
	elements
		add:
			(AltDynamicEyeElement
				host: self object
				label: 'decompiled'
				description: [ self object printString ]
				value: self decompiledParser);
		add: (AltSmaCCStateStackElement host: self object);
		add: (AltSmaCCPotentialActionsElement host: self object);
		add:
			(AltDynamicEyeElement
				host: self object
				label: 'current token'
				description: [ self currentToken printString ]
				value: [ self object currentToken ]);
		add:
			(AltDynamicEyeElement
				host: self object
				label: 'error token'
				description: [ self errorToken printString ]
				value: [ self object errorToken ])
]

{ #category : #accessing }
AltSmaCCParserInspector >> currentToken [
	"My current token, using info I have as a parser."

	^ self object currentToken
		ifNotNil: [ :aToken | AltSmaCCTokenDescription on: aToken in: self object ]
]

{ #category : #accessing }
AltSmaCCParserInspector >> decompiledParser [
	"Returns a decompiled version of self. For now, keep it simple."

	^ (SmaCCRParseTable for: self object) decode
]

{ #category : #accessing }
AltSmaCCParserInspector >> errorToken [
	"My error token."

	^ self object errorToken
		ifNotNil: [ :aToken | AltSmaCCTokenDescription on: aToken in: self object ]
]
