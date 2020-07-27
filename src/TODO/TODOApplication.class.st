Class {
	#name : #TODOApplication,
	#superclass : #SpApplication,
	#category : #TODO
}

{ #category : #running }
TODOApplication >> start [

	(self new: TODOListPresenter) openWithSpec 
]
