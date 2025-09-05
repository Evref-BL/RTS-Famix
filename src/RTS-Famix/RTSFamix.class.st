Class {
	#name : 'RTSFamix',
	#superclass : 'Object',
	#category : 'RTS-Famix',
	#package : 'RTS-Famix'
}

{ #category : 'comparison' }
RTSFamix >> diffBetweenFamixModels: model1 and: model2 [
	| result |
	result := (FXDiff runOnBaseModel: model1 targetModel: model2) result.
	^ result

]

{ #category : 'getter' }
RTSFamix >> getStories: diffCollection [

	| stories |
	stories := OrderedCollection new.

	{ diffCollection additions.
	  diffCollection removals.
	  diffCollection renames } do: [ :collection |
		collection do: [ :entity | stories addAll: entity entity tags ] ].

	 ^(stories reject: #isNil) asSet asOrderedCollection
]
