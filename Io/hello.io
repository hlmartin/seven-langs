"Hi ho, Io!" println

Vehicle := Object clone
Vehicle drive := "We're goin' places."
Vehicle park := "Pitstop time."
Vehicle moving ::= false
Vehicle start := method(
    if(moving, 
    "We're already on the road!", 
    Vehicle setMoving(true); Vehicle drive)
)
Vehicle stop := method(
    if(moving,
    Vehicle setMoving(false); Vehicle park,
    "We ain't goin' nowhere!")
)
Car := Vehicle clone
Car horn := "Honk honk!"

toyota := Car clone
toyota start println
toyota start println
toyota stop println
toyota stop println
toyota horn println

