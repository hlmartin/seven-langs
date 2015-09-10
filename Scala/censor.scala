trait Censor {
  import scala.io.Source

  val curses: Map[String, String] = loadWords()

  def loadWords(): Map[String, String] = {
    val file = Source.fromFile("censored.csv")
    val iter = file.getLines.drop(1).map(_.split(","))
    var temp = Map[String, String]()
    iter.foreach(a => temp += a(0) -> a(1))
    temp
  }

  def censor(text: String): String = {
    var str = text
    curses.foreach (curse =>
      str = str.replace(curse._1, curse._2)
    )
    str
  }
}

class Text(val text: String)
class SafeText(override val text: String) extends Text(text) with Censor

val string = new SafeText("Hello this is darn dog number one")
println(string.censor(string.text))