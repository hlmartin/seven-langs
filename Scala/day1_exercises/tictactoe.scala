class Board {
  var board = Array(Array(" ", " ", " "), Array(" ", " ", " "), Array(" ", " ", " "))

  def display() {
    println()
    (0 to 2).foreach { row => 
      (0 to 2).foreach { col => 
        print(board(row)(col))
        if (col == 2) println(" ") else print(" || ")
      }
      if (row != 2) println("===========")
    }
    println()
  }

  def play(xy: String, row: Int, col: Int) {
    board(row)(col) = xy
  }

  def won(xy: String): Boolean = {
    // Check rows
    (0 to 2).foreach { row => 
      if(board(row)(0) == xy && board(row)(1) == xy && board(row)(2) == xy) return true
    }

    // Check columns
    (0 to 2).foreach { col =>
      if(board(0)(col) == xy && board(1)(col) == xy && board(2)(col) == xy) return true
    }

    // Check diagonals
    if(board(0)(0) == xy && board(1)(1) == xy && board(2)(2) == xy) return true
    if(board(0)(2) == xy && board(1)(1) == xy && board(2)(0) == xy) return true

    return false
  }

  def tie(): Boolean = {
    // It's not a tie if there are free spaces remaining.
    board.foreach { row =>
      row.foreach { sqr =>
        if (sqr == " ") return false
      }
    }

    // Otherwise it's only a tie if neither side wins.
    return !(won("X") || won("O"))
  }

  def validMove(row: Int, col: Int): Boolean = {
    board(row)(col) == " "
  }

  def gameIsFinished(): Boolean = {
    status() == "X Win" || status() == "O Win" || status() == "Tie"
  }

  def status(): String = {
    if(won("X")) {
      "X Win"
    } else if (won("O")) {
      "O Win"
    } else if (tie()) {
      "Tie"
    } else {
      "In Play"
    }
  }
}

class TicTacToe {
  var board = new Board
  var turn = 1

  def start() {
    println("A new game of Tic Tac Toe is starting!")
    while(!board.gameIsFinished) {
      board.display()
      playTurn()
      if(board.gameIsFinished) {
        board.display()
        println("Game Over: " + board.status)
      }
    }
  }

  def playTurn() {
    println("Player " + turn + "'s turn.")
    var valid = false
    var row = 0
    var col = 0
    while(!valid) {
      while(row < 1 || row > 3) {
        println("Pick a row from 1 - 3")
        print("> ")
        row = readInt()
      }
      while(col < 1 || col > 3) {
        println("Pick a column from 1 - 3")
        print("> ")
        col = readInt()
      }
      if(board.validMove(row - 1, col - 1)) {
        valid = true
      } else {
        println("Invalid move, try again")
        row = 0
        col = 0
      }
    }
    if(turn == 1) {
      playO(row, col)
      turn += 1
    } else {
      playX(row, col)
      turn -= 1
    }
  }

  def playX(row: Int, col: Int) = board.play("X", row - 1, col - 1)
  def playO(row: Int, col: Int) = board.play("O", row - 1, col - 1)
}

val game = new TicTacToe
game.start