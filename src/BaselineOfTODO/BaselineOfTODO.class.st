Class {
	#name : #BaselineOfTODO,
	#superclass : #BaselineOf,
	#category : #BaselineOfTODO
}

{ #category : #baselines }
BaselineOfTODO >> baseline: spec [
	<baseline>
	
	spec for: #'common' do: [
		self voyage: spec.
		spec package: 'TODO' ]
]

{ #category : #'as yet unclassified' }
BaselineOfTODO >> voyage: spec [

	spec baseline: 'Voyage' with: [ 
		spec 
			repository: 'github://pharo-nosql/voyage';
			loads: 'memory tests' ].
]
