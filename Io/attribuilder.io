OperatorTable addAssignOperator(":", "atPutNumber")
curlyBrackets := method(
  r := Map clone
  call message arguments foreach(
    arg,
    r doMessage(arg))
  r
)
Map atPutNumber := method(
  self atPut(
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
    call evalArgAt(1))
)
s := {"Bob Smith": "5195551212", "Tara Croft": "193784719"}