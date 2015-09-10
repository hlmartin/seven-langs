val shiritori = List("banana", "nashi", "shio", "osushi", "shiitake", "keeki", "kitsune udon")
val characters = shiritori.foldLeft(0)((sum, word) => sum + word.length)
println("There are " + characters + " characters in the shiritori list.")