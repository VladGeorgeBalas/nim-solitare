include vector
import std/random

type Card = object
    number : range[0..13]
    suit : char

proc genCard( tmp_number : range[0..13], tmp_suit : char) : Card =
    var tmp_res : Card
    tmp_res.number = tmp_number
    tmp_res.suit = tmp_suit

    return tmp_res

randomize(123)

var stock : tuple[unknown: vector[Card], known: vector[Card]]
stock.unknown.initVector
stock.known.initVector

var tableau : array[7, tuple[unknown: vector[Card], known: vector[Card]]]
for i in 0..6:
    tableau[i].unknown.initVector
    tableau[i].known.initVector
    
var foundation : array[4, tuple[unknown: vector[Card], known: vector[Card]]]
for i in 0..4:
    foundation[i].unknown.initVector
    foundation[i].known.initVector

var talon : vector[Card]
talon.initVector

#functie de printare
proc prtTable() 

#adauga functie de shuffle
proc shuffle[T](this : vector[T], cycles : int = 0) =
    for i in 0..(if cycles!=0: cycles else: 2*this.length):
        let a : int = rand(int(this.length - 1))
        let b : int = rand(int(this.length - 1))

        let tmp : Card = this[a]
        this[a] = this[b]
        this[b] = tmp

#generare teanc de 52 de carti
block gen_stock:
    for j in "cdhs":
        for i in 0..13:
            stock.unknown.addTail(genCard(i, j))

    # functie shuffle
    stock.unknown.shuffle

    stock.known.addTail(stock.unknown[stock.unknown.length - 1])

#adauga block de separare in deck-uri


#adauga comenzi

proc prtTable() = echo "Hello world"