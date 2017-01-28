#Tic Tac Toe

A tech test to create the business logic for a game of tic-tac-toe using Ruby

##To use
* Clone this repository and open in the REPL
* Require the neccessary files and create a new game adn players
```
$ player1 = Player.new('Amanda')
$ player2 = Player.new('Bob')
$ game = Game.new(Board.new(Field))
$ game.add_player(player1)
$ game.add_player(player2)
```
* Players can then take turns to enter the co-ordinates of the field they wish to claim (A1, B2, etc)
* Keep playing either until someone wins, or no more fields are left.

##Screenshots
![Imgur](http://i.imgur.com/m0Eltpc.png)
![Imgur](http://i.imgur.com/1D7PPfb.png)

##Tests
To run the tests, ensure rspec is installed and run `rspec` in the command line.
