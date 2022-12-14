Class {
	#name : #CGLRAbstractNodeVisitor,
	#superclass : #SmaCCParseNodeVisitor,
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitAbstract: anAbstract [
	^ self visitSmaCCParseNode: anAbstract
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitAbstractDeclarator: anAbstractDeclarator [
	^ self visitAbstract: anAbstractDeclarator
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitArray: anArray [
	^ self visitAbstract: anArray
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitArrayDeclarator: anArrayDeclarator [
	^ self visitAbstract: anArrayDeclarator
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitArrow: anArrow [
	^ self visitAbstract: anArrow
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitAssignment: anAssignment [
	^ self visitAbstract: anAssignment
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitBinary: aBinary [
	^ self visitAbstract: aBinary
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitBreakStatement: aBreakStatement [
	^ self visitAbstract: aBreakStatement
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitCall: aCall [
	^ self visitAbstract: aCall
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitCastExpression: aCastExpression [
	^ self visitAbstract: aCastExpression
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitCompoundStatement: aCompoundStatement [
	^ self visitAbstract: aCompoundStatement
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitConstant: aConstant [
	^ self visitAbstract: aConstant
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitContinueStatement: aContinueStatement [
	^ self visitAbstract: aContinueStatement
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitDeclaration: aDeclaration [
	^ self visitAbstract: aDeclaration
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitDeclarator: aDeclarator [
	^ self visitAbstract: aDeclarator
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitDecrement: aDecrement [
	^ self visitAbstract: aDecrement
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitDoStatement: aDoStatement [
	^ self visitAbstract: aDoStatement
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitEnum: anEnum [
	^ self visitAbstract: anEnum
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitEnumerator: anEnumerator [
	^ self visitAbstract: anEnumerator
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitExpression: anExpression [
	^ self visitAbstract: anExpression
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitExpressionStatement: anExpressionStatement [
	^ self visitAbstract: anExpressionStatement
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitForStatement: aForStatement [
	^ self visitAbstract: aForStatement
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitFunctionDeclarator: aFunctionDeclarator [
	^ self visitAbstract: aFunctionDeclarator
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitFunctionDefinition: aFunctionDefinition [
	^ self visitAbstract: aFunctionDefinition
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitFunctionPointerDeclarator: aFunctionPointerDeclarator [
	^ self visitAbstract: aFunctionPointerDeclarator
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitGotoStatement: aGotoStatement [
	^ self visitAbstract: aGotoStatement
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitIdentifier: anIdentifier [
	^ self visitAbstract: anIdentifier
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitIdentifierExpression: anIdentifierExpression [
	^ self visitAbstract: anIdentifierExpression
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitIncrement: anIncrement [
	^ self visitAbstract: anIncrement
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitInitDeclarator: anInitDeclarator [
	^ self visitAbstract: anInitDeclarator
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitInitializer: anInitializer [
	^ self visitAbstract: anInitializer
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitLabeledStatement: aLabeledStatement [
	^ self visitAbstract: aLabeledStatement
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitParameterDeclaration: aParameterDeclaration [
	^ self visitAbstract: aParameterDeclaration
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitParenthesizedExpression: aParenthesizedExpression [
	^ self visitAbstract: aParenthesizedExpression
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitPoint: aPoint [
	^ self visitAbstract: aPoint
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitReturnStatement: aReturnStatement [
	^ self visitAbstract: aReturnStatement
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitSelectionStatement: aSelectionStatement [
	^ self visitAbstract: aSelectionStatement
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitStringLiteral: aStringLiteral [
	^ self visitAbstract: aStringLiteral
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitStructDeclaration: aStructDeclaration [
	^ self visitAbstract: aStructDeclaration
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitStructDeclarator: aStructDeclarator [
	^ self visitAbstract: aStructDeclarator
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitStructOrUnionSpecifier: aStructOrUnionSpecifier [
	^ self visitAbstract: aStructOrUnionSpecifier
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitSwitchStatement: aSwitchStatement [
	^ self visitAbstract: aSwitchStatement
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitTernary: aTernary [
	^ self visitAbstract: aTernary
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitTranslationUnit: aTranslationUnit [
	^ self visitAbstract: aTranslationUnit
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitTypeName: aTypeName [
	^ self visitAbstract: aTypeName
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitTypename: aTypename [
	^ self visitAbstract: aTypename
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitUnaryExpression: anUnaryExpression [
	^ self visitAbstract: anUnaryExpression
]

{ #category : #generated }
CGLRAbstractNodeVisitor >> visitWhileStatement: aWhileStatement [
	^ self visitAbstract: aWhileStatement
]
