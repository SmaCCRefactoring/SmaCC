accessing
action: aSmaCCSymbol prefer: aClass 
	| action actionItem eachAction |
	action := SmaCCRejectAction new.
	self do: 
			[:each | 
			eachAction := each action: aSmaCCSymbol.
			action class = SmaCCRejectAction 
				ifTrue: 
					[action := eachAction.
					actionItem := each]
				ifFalse: 
					[(eachAction = action or: [eachAction class = SmaCCRejectAction]) 
						ifFalse: 
							[eachAction class = SmaCCShiftAction | (action class = SmaCCShiftAction) 
								ifTrue: 
									["Shift/Reduce conflict -- check precedence"

									(aSmaCCSymbol precedence isNil 
										or: [each precedence isNil or: [actionItem precedence isNil]]) 
											ifTrue: 
												["No precedence, choose shift"

												eachAction class = SmaCCShiftAction 
													ifTrue: 
														[self 
															raiseXReduceNotification: each
															with: actionItem
															type: 'Shift/Reduce Conflict'.
														action := eachAction.
														actionItem := each]
													ifFalse: 
														[self 
															raiseXReduceNotification: actionItem
															with: each
															type: 'Shift/Reduce Conflict']]
											ifFalse: 
												[(each precedence > actionItem precedence 
													or: [each precedence = actionItem precedence and: [eachAction class = aClass]]) 
														ifTrue: 
															[self 
																raiseXReduceNotification: each
																with: actionItem
																type: 'Shift/Reduce Conflict (handled by precedence rules)'.
															action := eachAction.
															actionItem := each]
														ifFalse: 
															[(each precedence = actionItem precedence and: [SmaCCRejectAction = aClass]) 
																ifTrue: 
																	[self 
																		raiseXReduceNotificationWithNoPreferredItem: actionItem
																		with: each
																		type: 'Shift/Reduce Conflict (handled by precedence rules)'.
																	^aClass new]
																ifFalse: 
																	[self 
																		raiseXReduceNotification: actionItem
																		with: each
																		type: 'Shift/Reduce Conflict (handled by precedence rules)']]]]
								ifFalse: 
									["Reduce/Reduce conflict -- just pick one and proceed"

									self 
										raiseXReduceNotification: actionItem
										with: each
										type: 'Reduce/Reduce Conflict']]]].
	^action