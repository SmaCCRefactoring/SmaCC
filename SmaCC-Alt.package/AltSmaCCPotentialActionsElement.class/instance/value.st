accessing
value
	| items |
	items := OrderedCollection new.
	self
		actionsAndSymbolsForState: host stateStack last
		do: [ :action :symbol | 
			items
				add:
					(host symbolNames at: symbol ifAbsent: [ '? ' ])
						-> (self actionLabelFor: action) ].
	^ items