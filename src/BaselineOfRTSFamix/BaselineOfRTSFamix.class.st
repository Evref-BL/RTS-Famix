Class {
	#name : 'BaselineOfRTSFamix',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfRTSFamix',
	#package : 'BaselineOfRTSFamix'
}

{ #category : 'baselines' }
BaselineOfRTSFamix >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self defineDependencies: spec.
		self definePackages: spec.
		self defineGroups: spec ]
]

{ #category : 'baselines' }
BaselineOfRTSFamix >> defineDependencies: spec [
]

{ #category : 'baselines' }
BaselineOfRTSFamix >> defineGroups: spec [

]

{ #category : 'baselines' }
BaselineOfRTSFamix >> definePackages: spec [

	spec package: 'RTS-Famix'
]
