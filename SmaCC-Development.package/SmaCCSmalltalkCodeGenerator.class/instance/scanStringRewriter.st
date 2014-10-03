compiling
scanStringRewriter
	^ RBParseTreeRewriter new
		replace: 'self step. currentCharacter == `#l1 ifTrue: [self step. currentCharacter == `#l2 ifTrue: `@b]. `@.Stmts'
			with:
				'(self scanForString: `{RBLiteralNode value: (String with: `#l1 value with: `#l2 value)}) ifTrue: `@b. `@.Stmts';
		replace: '(self scanForString: `#l1) ifTrue: [self step. currentCharacter == `#l2 ifTrue: `@b]. `@.Stmts'
			with: '(self scanForString: `{RBLiteralNode value: (`#l1 value copyWith: `#l2 value)}) ifTrue: `@b. `@.Stmts';
		replace:
				'self recordMatch: `@m. self step. currentCharacter == `#l1 ifTrue: [self recordMatch: `@m. self step. currentCharacter == `#l2 ifTrue: `@b]. `@.Stmts'
			with:
				'self recordMatch: `@m. (self scanForString: `{RBLiteralNode value: (String with: `#l1 value with: `#l2 value)}) ifTrue: `@b. `@.Stmts';
		replace:
				'self recordMatch: `@m. (self scanForString: `#l1) ifTrue: [self recordMatch: `@m. self step. currentCharacter == `#l2 ifTrue: `@b]. `@.Stmts'
			with:
				'self recordMatch: `@m. (self scanForString: `{RBLiteralNode value: (`#l1 value copyWith: `#l2 value)}) ifTrue: `@b. `@.Stmts';
		yourself