import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => HomescreenState();
}
// wala htghlt
class HomescreenState extends State<Homescreen> {
  // Variables to store the scores for both teams
  int teamAScore = 0;
  int teamBScore = 0;

  // Functions to update scores
  void addPointsToTeamA(int points) {
    setState(() {
      teamAScore += points;
    });
  }

  void addPointsToTeamB(int points) {
    setState(() {
      teamBScore += points;
    });
  }

  ElevatedButton _buildButton(String label,String team,int points){
    return ElevatedButton(
      onPressed: () {
        if (team=='Team A') addPointsToTeamA(points);
        else addPointsToTeamB(points);
      },
      child: Text(label),
      style: ElevatedButton.styleFrom(
        //fixedSize: Size(20, 30),
        backgroundColor: Colors.orange,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // Makes the button rectangular
        ),
      ),
    );
  }

  // Function to reset scores
  void resetScores() {
    setState(() {
      teamAScore = 0;
      teamBScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Points Counter'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text(
                    'Team A',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    '$teamAScore',
                    style: const TextStyle(fontSize: 200),
                  ),
                  SizedBox(height: 5,),
                  _buildButton('Add 1 point  ', 'Team A', 1),
                  SizedBox(height: 5,),
                  _buildButton('Add 2 points', 'Team A', 2),
                  SizedBox(height: 5,),
                  _buildButton('Add 3 points', 'Team A', 3),

                ],
              ),
              Container(
                width: 2, // Thickness of the line
                height: 470, // Adjust the height of the line
                color: Colors.grey, // Color of the line
              ),
              Column(
                children: [
                  const Text(
                    'Team B',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    '$teamBScore',
                    style: const TextStyle(fontSize: 200),
                  ),
                  SizedBox(height: 5,),
                  _buildButton('Add 1 point  ', 'Team B', 1),
                  SizedBox(height: 5,),
                  _buildButton('Add 2 points', 'Team B', 2),
                  SizedBox(height: 5,),
                  _buildButton('Add 3 points', 'Team B', 3),

                ],
              ),
            ],
          ),
          const SizedBox(height: 100),
          ElevatedButton(
            onPressed: resetScores,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // Rectangular shape
              ),
            ),
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }
}
