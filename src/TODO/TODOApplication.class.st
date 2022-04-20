Class {
	#name : #TODOApplication,
	#superclass : #SpApplication,
	#category : #TODO
}

{ #category : #running }
TODOApplication >> start [

	(TODOListPresenter newApplication: self) open
]
