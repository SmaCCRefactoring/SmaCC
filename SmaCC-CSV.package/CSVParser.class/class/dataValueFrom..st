private
dataValueFrom: aSmaCCToken
	| string |
	string := aSmaCCToken value.
	string isEmpty
		ifTrue: [ ^ nil ].
	string first = $'
		ifTrue: [ ^ (string copyFrom: 2 to: string size - 1) copyReplaceAll: '''''' with: '''' ].
	string first = $"
		ifTrue: [ ^ (string copyFrom: 2 to: string size - 1) copyReplaceAll: '""' with: '"' ].
	^ string