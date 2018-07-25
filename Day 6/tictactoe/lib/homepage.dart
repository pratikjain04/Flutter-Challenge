import 'package:flutter/material.dart';
import 'package:tictactoe/game_button.dart';
import 'package:tictactoe/custom_dialog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<GameButton> buttonList;
  var player1, player2, activePlayer;

  @override
  void initState() {
    super.initState();
    buttonList = doInit();
  }

  List<GameButton> doInit(){
    //making a list of the moves player1 has choosed. This will help in judgement of the winner
    player1 = new List();
    player2 = new List();
    activePlayer = 1;


    var gameButtons = <GameButton>[
      new GameButton(id: 1),
      new GameButton(id: 2),
      new GameButton(id: 3),
      new GameButton(id: 4),
      new GameButton(id: 5),
      new GameButton(id: 6),
      new GameButton(id: 7),
      new GameButton(id: 8),
      new GameButton(id: 9),
    ];
    return gameButtons;
  }

void playGame(GameButton gb){

    //setting the state because every time I press the button I want the changes on the screen to be saved instantaneously
    setState(() {
      if(activePlayer==1) {
        gb.text = 'X';
        gb.bg = Colors.red;
        activePlayer = 2;
        player1.add(gb.id);
        //adding the id of the gameButton currently pressed by player1 to the list,so that we can evaluate later.
      }
      else {

        gb.text = "0";
        gb.bg = Colors.black;
        activePlayer = 1;
        player2.add(gb.id);
        //adding the id of the gameButton currently pressed by player2 to the list,so that we can evaluate later.
        }
      gb.enabled = false;   //because we want to disable the button which are played
      checkWinner();
    });
}


  checkWinner(){
    int winner = -1;

    //Player1 ---WINNER CODE

    if(player1.contains(1) && player1.contains(2) && player1.contains(3)) //ROW 1
      winner=1;
    if(player2.contains(1) && player2.contains(2) && player2.contains(3)) //ROW 1
      winner=2;


    if (player1.contains(4) && player1.contains(5) && player1.contains(6))   //ROW 2
      winner=1;
    if (player2.contains(4) && player2.contains(5) && player2.contains(6))   //ROW 2
      winner=2;


    if (player1.contains(7) && player1.contains(8) && player1.contains(9))   //ROW 3
      winner=1;
    if (player2.contains(7) && player2.contains(8) && player2.contains(9))   //ROW 3
      winner=2;

    if (player1.contains(1) && player1.contains(4) && player1.contains(7))   //COLUMN 1
      winner=1;
    if (player2.contains(1) && player2.contains(4) && player2.contains(7))   //COLUMN 1
      winner=2;


    if (player1.contains(2) && player1.contains(5) && player1.contains(8))   //COLUMN 2
      winner=1;
    if (player2.contains(2) && player2.contains(5) && player2.contains(8))   //COLUMN 2
      winner=2;


    if (player1.contains(3) && player1.contains(6) && player1.contains(9))   //COLUMN 3
      winner=1;
    if (player2.contains(3) && player2.contains(6) && player2.contains(9))   //COLUMN 3
      winner=2;


    if (player1.contains(1) && player1.contains(5) && player1.contains(9))   //DIAGONAL 1
      winner=1;
    if (player2.contains(1) && player2.contains(5) && player2.contains(9))   //DIAGONAL 1
      winner=2;


    if (player1.contains(3) && player1.contains(5) && player1.contains(7))   //DIAGONAL 2
      winner=1;
    if (player2.contains(3) && player2.contains(5) && player2.contains(7))   //DIAGONAL 2
      winner=2;



    //check for winner

    if(winner!=-1)
      {
        if(winner == 1){
        showDialog(
             context: context,
            builder: (_) => new CustomDialog("Player 1 Won!!", "Reset the Game", resetGame));
        }
        else {
          showDialog(
              context: context,
              builder: (_) => new CustomDialog("Player 2 Won!!", "Reset the Game", resetGame));
        }

    }

  }

  void resetGame(){
    if(Navigator.canPop(context)) Navigator.pop(context);
      {
        setState(() {
          buttonList = doInit();    //Initializing the buttons again to the start by calling the doInit()
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Center(child: new Text('Tic Tac Toe')),
        backgroundColor: Colors.black,
      ),
      body: new GridView.builder(
          padding: const EdgeInsets.all(10.0),
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
            crossAxisSpacing: 9.0,
            mainAxisSpacing: 9.0,

          ),
          itemCount: buttonList.length,
          itemBuilder: (context,index){
            return new SizedBox(
              width: 100.0,
              height: 100.0,
              child: new RaisedButton(
                padding: const EdgeInsets.all(8.0),
                onPressed: buttonList[index].enabled ? ()=> playGame(buttonList[index]):null,
                child: new Text(
                  buttonList[index].text,
                  style: new TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                color: buttonList[index].bg,
                disabledColor: buttonList[index].bg,


              ),
            );
          },

      ),
    );
  }
}
