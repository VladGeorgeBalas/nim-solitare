type 
    vector[T] = object
        head : ptr node[T]
        tail : ptr node[T]

        length : int
        
    node[T] = object
        next : ptr node[T]
        prev : ptr node[T]

        val : T

proc initVector[T](this : var vector[T]) =
    this.head = nil
    this.tail = nil
    this.length = 0
    
proc `[]`[T](this : vector[T], count : int) : T =
    var tmp : ptr node[T] = this.head

    for i in 1..count:
        tmp = tmp.next

    return tmp.val

proc `[]=`[T](this : vector[T], count : int, value: T) =
    var tmp : ptr node[T] = this.head

    for i in 1..count:
        tmp = tmp.next

    tmp.val = value

proc addTail[T](this: var vector[T], toAdd: T)=
    # daca vect este gol
    if this.head == nil:
        this.head = cast[ptr node[T]](alloc(sizeof(ptr node[T])))

        this.head.next = nil
        this.head.prev = nil
        this.head.val = toAdd
 
        this.tail = this.head
    else:
        this.tail.next = cast[ptr node[T]](alloc(sizeof(ptr node[T])))
        let tmp = this.tail

        this.tail = this.tail.next

        this.tail.next = nil
        this.tail.prev = tmp
        this.tail.val = toAdd

    this.length += 1

proc addHead[T](this: var vector[T], toAdd: T)=
    # daca vect e gol
    if not(this.head):
        this.head = cast[ptr node[T]](alloc(sizeof(ptr node[T])))

        this.head.next = nil
        this.head.prev = nil
        this.head.val = toAdd

        this.tail = this.head
    else:
        let tmp = this.head
        this.head = cast[ptr node[T]](alloc(sizeof(ptr node[T])))

        this.tail.next = tmp
        this.tail.prev = nil
        this.tail.val = toAdd

        this.head.next.prev = this.head
            
    this.length += 1

proc popTail[T](this: var vector[T]) : T =
    result = this.tail.val
    
    let tmp : ptr node[T] = this.tail.prev
    dealloc(this.tail)
    this.tail = tmp
    
    if this.tail != nil:
        this.tail.next = nil
    else:
        this.head = nil

proc popHead[T](this : var vector[T]) : T =

