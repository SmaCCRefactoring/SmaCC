Class {
	#name : #JSProgramNodeVisitor,
	#superclass : #SmaCCParseNodeVisitor,
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #generated }
JSProgramNodeVisitor >> visitArrayLiteral: anArrayLiteral [
	^ self visitExpression: anArrayLiteral
]

{ #category : #generated }
JSProgramNodeVisitor >> visitAssignmentExpression: anAssignmentExpression [
	^ self visitExpression: anAssignmentExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitBinaryExpression: aBinaryExpression [
	^ self visitExpression: aBinaryExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitBlockStatement: aBlockStatement [
	^ self visitStatement: aBlockStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitBooleanLiteral: aBooleanLiteral [
	^ self visitLiteral: aBooleanLiteral
]

{ #category : #generated }
JSProgramNodeVisitor >> visitBreakStatement: aBreakStatement [
	^ self visitStatement: aBreakStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitCallExpression: aCallExpression [
	^ self visitExpression: aCallExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitCaseClause: aCaseClause [
	^ self visitProgram: aCaseClause
]

{ #category : #generated }
JSProgramNodeVisitor >> visitCommaExpression: aCommaExpression [
	^ self visitExpression: aCommaExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitConditionalExpression: aConditionalExpression [
	^ self visitExpression: aConditionalExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitContinueStatement: aContinueStatement [
	^ self visitStatement: aContinueStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitDebuggerStatement: aDebuggerStatement [
	^ self visitStatement: aDebuggerStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitDefaultClause: aDefaultClause [
	^ self visitProgram: aDefaultClause
]

{ #category : #generated }
JSProgramNodeVisitor >> visitDoWhileStatement: aDoWhileStatement [
	^ self visitStatement: aDoWhileStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitEmptyStatement: anEmptyStatement [
	^ self visitStatement: anEmptyStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitExpression: anExpression [
	^ self visitProgram: anExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitExpressionStatement: anExpressionStatement [
	^ self visitStatement: anExpressionStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitFile: aFile [
	^ self visitProgram: aFile
]

{ #category : #generated }
JSProgramNodeVisitor >> visitForInStatement: aForInStatement [
	^ self visitStatement: aForInStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitForOfStatement: aForOfStatement [
	^ self visitStatement: aForOfStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitForStatement: aForStatement [
	^ self visitStatement: aForStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitFunction: aFunction [
	^ self visitExpression: aFunction
]

{ #category : #generated }
JSProgramNodeVisitor >> visitGetPropertyAssignment: aGetPropertyAssignment [
	^ self visitProgram: aGetPropertyAssignment
]

{ #category : #generated }
JSProgramNodeVisitor >> visitIfStatement: anIfStatement [
	^ self visitStatement: anIfStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitIndexedPropertyExpression: anIndexedPropertyExpression [
	^ self visitExpression: anIndexedPropertyExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitLabelledStatement: aLabelledStatement [
	^ self visitStatement: aLabelledStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitLiteral: aLiteral [
	^ self visitExpression: aLiteral
]

{ #category : #generated }
JSProgramNodeVisitor >> visitNameExpression: aNameExpression [
	^ self visitExpression: aNameExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitNamedPropertyExpression: aNamedPropertyExpression [
	^ self visitExpression: aNamedPropertyExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitNewExpression: aNewExpression [
	^ self visitExpression: aNewExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitNullLiteral: aNullLiteral [
	^ self visitLiteral: aNullLiteral
]

{ #category : #generated }
JSProgramNodeVisitor >> visitNumericLiteral: aNumericLiteral [
	^ self visitLiteral: aNumericLiteral
]

{ #category : #generated }
JSProgramNodeVisitor >> visitObjectLiteral: anObjectLiteral [
	^ self visitExpression: anObjectLiteral
]

{ #category : #generated }
JSProgramNodeVisitor >> visitPostfixExpression: aPostfixExpression [
	^ self visitExpression: aPostfixExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitProgram: aProgram [
	^ self visitSmaCCParseNode: aProgram
]

{ #category : #generated }
JSProgramNodeVisitor >> visitPropertyAssignment: aPropertyAssignment [
	^ self visitProgram: aPropertyAssignment
]

{ #category : #generated }
JSProgramNodeVisitor >> visitRegularExpressionLiteral: aRegularExpressionLiteral [
	^ self visitLiteral: aRegularExpressionLiteral
]

{ #category : #generated }
JSProgramNodeVisitor >> visitReturnStatement: aReturnStatement [
	^ self visitStatement: aReturnStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitSetPropertyAssignment: aSetPropertyAssignment [
	^ self visitProgram: aSetPropertyAssignment
]

{ #category : #generated }
JSProgramNodeVisitor >> visitStatement: aStatement [
	^ self visitProgram: aStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitStringLiteral: aStringLiteral [
	^ self visitLiteral: aStringLiteral
]

{ #category : #generated }
JSProgramNodeVisitor >> visitSwitchStatement: aSwitchStatement [
	^ self visitStatement: aSwitchStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitThisExpression: aThisExpression [
	^ self visitExpression: aThisExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitThrowStatement: aThrowStatement [
	^ self visitStatement: aThrowStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitTryStatement: aTryStatement [
	^ self visitStatement: aTryStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitUnaryExpression: anUnaryExpression [
	^ self visitExpression: anUnaryExpression
]

{ #category : #generated }
JSProgramNodeVisitor >> visitVariableDeclaration: aVariableDeclaration [
	^ self visitProgram: aVariableDeclaration
]

{ #category : #generated }
JSProgramNodeVisitor >> visitVariableStatement: aVariableStatement [
	^ self visitStatement: aVariableStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitWhileStatement: aWhileStatement [
	^ self visitStatement: aWhileStatement
]

{ #category : #generated }
JSProgramNodeVisitor >> visitWithStatement: aWithStatement [
	^ self visitStatement: aWithStatement
]
