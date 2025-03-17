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

	| additionsCollection deletionsCollection renamesCollection stories |
	stories := OrderedCollection new.

	additionsCollection := diffCollection additions.

	additionsCollection do: [ :entity | stories add: entity entity tags ].

	deletionsCollection := diffCollection removals.

	deletionsCollection do: [ :entity | stories add: entity entity tags ].

	renamesCollection := diffCollection renames.

	renamesCollection do: [ :entity | stories add: entity entity tags ].

	^ (stories select: [ :each | each ifNotNil: [ each isNotEmpty ] ])
		  asSet asOrderedCollection
]
