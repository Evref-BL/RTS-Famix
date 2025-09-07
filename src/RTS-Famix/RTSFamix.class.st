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
RTSFamix >> getMethodDiffStories: modelSource and: modelTarget [

	| methodsA methodsB differentTags |

"Construire un dictionnaire qualifiedName -> méthode pour chaque modèle"
methodsA := Dictionary new.
modelSource allMethods do: [ :m |
    methodsA at: ('{1}>>{2}' format: { m parentType name. m signature }) put: m ].

methodsB := Dictionary new.
modelTarget allMethods do: [ :m |
    methodsB at: ('{1}>>{2}' format: { m parentType name. m signature }) put: m ].

"Comparer les méthodes communes et accumuler directement les tags"
differentTags := OrderedCollection new.
(methodsA keys asSet intersection: methodsB keys asSet) do: [ :key |
    | mA mB hashA hashB |
    mA := methodsA at: key.
    mB := methodsB at: key.
    hashA := MD5 hashMessage: (mA sourceText ifNil: [ '' ]).
    hashB := MD5 hashMessage: (mB sourceText ifNil: [ '' ]).
    hashA = hashB ifFalse: [
        differentTags addAll: (mA tags ifNil: [ #() ]).] ].

^ differentTags

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
