"
CSV Exporter
"
Class {
	#name : #CSVExporter,
	#superclass : #Object,
	#instVars : [
		'exporter'
	],
	#category : #CSVExporter
}

{ #category : #export }
CSVExporter >> exportToCSV [
    | filePath stream writer classes |
    classes := MooseModel root first allModelClasses.

    filePath := 'exported_', Date today yyyymmdd, '.csv'.
    stream := filePath asFileReference writeStream.

    writer := NeoCSVWriter on: stream.
    writer nextPut: #('Class Name' 'Number of Methods' 'Number of Attributes').
    classes do: [ :class |
        writer nextPut: (Array 
            with: class name
            with: class methods size
            with: class attributes size).
    ].

    writer close.
]
