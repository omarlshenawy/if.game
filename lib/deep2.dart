import 'package:flutter/material.dart';

class GameHomeScreen extends StatefulWidget {
  const GameHomeScreen({super.key});

  @override
  State<GameHomeScreen> createState() => _GameHomeScreenState();
}

class _GameHomeScreenState extends State<GameHomeScreen> {
  int currentLevel = 1;
  int score = 0;
  bool showTutorial = true;

  void startGame() {
    setState(() {
      showTutorial = false;
    });
  }


  void levelComplete() {
    setState(() {
      if (currentLevel < 3) {
        currentLevel++;
        score += 10;
      } else {
        score += 20;
        // Game finished, show score and return to tutorial
        showScoreDialog();
      }
    });
  }

  void resetGame() {
    setState(() {
      showScoreDialog(isReset: true);
    });
  }

// New method to show score dialog
  void showScoreDialog({bool isReset = false}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isReset ? 'Game Restarted' : 'Game Completed!',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                  fontFamily: 'ComicNeue',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Icon(
                Icons.emoji_events,
                color: Colors.orange[400],
                size: 60,
              ),
              const SizedBox(height: 20),
              Text(
                'Your Score: $score',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      currentLevel = 1;
                      score = 0;
                      showTutorial = true; // return to tutorial
                    });
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'OK',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final isTablet = MediaQuery.of(context).size.width < 1024;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFF3E0), Color(0xFFFFE0B2)],
          ),
        ),
        child: Column(
          children: [
            // Responsive Header
            Container(
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 10 : 15,
                horizontal: isMobile ? 10 : 20,
              ),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                boxShadow: [
                  BoxShadow(
                    color: Colors.brown.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: isMobile
                  ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/pizza.png',
                        width: 30,
                        height: 30,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.local_pizza,
                              color: Colors.white, size: 30);
                        },
                      ),
                      const SizedBox(width: 8),
                      const Flexible(
                        child: Text(
                          'Pizza Conditionals',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'ComicNeue',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Level: $currentLevel/3',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Score: $score',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/pizza.png',
                        width: isTablet ? 35 : 40,
                        height: isTablet ? 35 : 40,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.local_pizza,
                              color: Colors.white,
                              size: isTablet ? 35 : 40);
                        },
                      ),
                      SizedBox(width: isTablet ? 8 : 10),
                      Text(
                        'Pizza Conditionals Game',
                        style: TextStyle(
                          fontSize: isTablet ? 20 : 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'ComicNeue',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isTablet ? 12 : 15,
                          vertical: isTablet ? 6 : 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Level: $currentLevel/3',
                          style: TextStyle(
                            fontSize: isTablet ? 14 : 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                      SizedBox(width: isTablet ? 10 : 15),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isTablet ? 12 : 15,
                          vertical: isTablet ? 6 : 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Score: $score',
                          style: TextStyle(
                            fontSize: isTablet ? 14 : 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Main Game Area
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(isMobile ? 10.0 : 20.0),
                child: showTutorial
                    ? TutorialScreen(startGame: startGame)
                    : LevelScreen(
                  level: currentLevel,
                  onLevelComplete: levelComplete,
                  onReset: resetGame,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TutorialScreen extends StatelessWidget {
  final VoidCallback startGame;

  const TutorialScreen({super.key, required this.startGame});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final isTablet = MediaQuery.of(context).size.width < 1024;

    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(isMobile ? 10 : 20),
        child: Container(
          constraints: BoxConstraints(maxWidth: isMobile ? 500 : 800),
          padding: EdgeInsets.all(isMobile ? 15 : 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.brown.withOpacity(0.2),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Welcome to Pizza Conditionals!',
                style: TextStyle(
                  fontSize: isMobile ? 24 : 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: isMobile ? 15 : 20),
              Image.asset(
                'assets/chef.png',
                width: isMobile ? 100 : 150,
                height: isMobile ? 100 : 150,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.emoji_people,
                      color: Colors.deepOrange,
                      size: isMobile ? 100 : 150);
                },
              ),
              SizedBox(height: isMobile ? 20 : 30),
              Text(
                'Learn "if, if else, else" statements through pizza making!',
                style: TextStyle(
                  fontSize: isMobile ? 16 : 20,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: isMobile ? 15 : 20),
              Container(
                padding: EdgeInsets.all(isMobile ? 15 : 20),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How to Play:',
                      style: TextStyle(
                        fontSize: isMobile ? 18 : 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    SizedBox(height: isMobile ? 8 : 10),
                    Text(
                      '1. Read the scenario about making pizza\n'
                          '2. Drag the correct decision to the empty box\n'
                          '3. Match the conditional logic: IF, ELSE IF, ELSE\n'
                          '4. Help Chef Antonio make the right pizza decisions!',
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 18,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: isMobile ? 20 : 30),
              ElevatedButton(
                onPressed: startGame,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 30 : 40,
                    vertical: isMobile ? 12 : 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Start Cooking!',
                  style: TextStyle(fontSize: isMobile ? 18 : 22),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LevelScreen extends StatefulWidget {
  final int level;
  final VoidCallback onLevelComplete;
  final VoidCallback onReset;

  const LevelScreen({
    super.key,
    required this.level,
    required this.onLevelComplete,
    required this.onReset,
  });

  @override
  State<LevelScreen> createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  String? draggedItem;
  String? droppedItem;
  bool isCorrect = false;
  bool showFeedback = false;

  final Map<int, Map<String, dynamic>> levelData = {
    1: {
      'title': 'Level 1: The Plain Cheese Decision',
      'scenario':
      'Chef Antonio needs to decide what to do when a customer orders a cheese pizza.',
      'condition': 'IF the customer wants extra cheese, add double cheese.',
      'question': 'What should Chef Antonio do?',
      'options': [
        'Add double cheese',
        'Add no cheese',
        'Make a pepperoni pizza instead',
      ],
      'correctAnswer': 'Add double cheese',
      'explanation':
      'Great! This is a simple IF statement. IF the condition is true (customer wants extra cheese), then do the action (add double cheese).',
    },
    2: {
      'title': 'Level 2: The Topping Dilemma',
      'scenario':
      'A customer is ordering a pizza but can\'t decide between pepperoni or mushrooms.',
      'condition':
      'IF the customer chooses pepperoni, add pepperoni. ELSE IF they choose mushrooms, add mushrooms.',
      'question': 'How should Chef Antonio decide?',
      'options': [
        'Add both pepperoni and mushrooms',
        'IF pepperoni then add pepperoni, ELSE IF mushrooms then add mushrooms',
        'Make a plain cheese pizza',
      ],
      'correctAnswer':
      'IF pepperoni then add pepperoni, ELSE IF mushrooms then add mushrooms',
      'explanation':
      'Excellent! This is an IF-ELSE IF statement. We check multiple conditions one after another.',
    },
    3: {
      'title': 'Level 3: The Complete Pizza Decision',
      'scenario':
      'Chef Antonio needs to handle all possible pizza orders: pepperoni, vegetarian, or anything else.',
      'condition':
      'IF pepperoni, add pepperoni. ELSE IF vegetarian, add vegetables. ELSE, make a cheese pizza.',
      'question': 'What is the complete decision logic?',
      'options': [
        'Always make pepperoni pizza',
        'IF pepperoni add pepperoni, ELSE add cheese',
        'IF pepperoni add pepperoni, ELSE IF vegetarian add vegetables, ELSE add cheese',
      ],
      'correctAnswer':
      'IF pepperoni add pepperoni, ELSE IF vegetarian add vegetables, ELSE add cheese',
      'explanation':
      'Perfect! This is a complete IF-ELSE IF-ELSE statement. It handles all possible cases!',
    },
  };

  void checkAnswer(String answer) {
    setState(() {
      droppedItem = answer;
      isCorrect = answer == levelData[widget.level]!['correctAnswer'];
      showFeedback = true;

      if (isCorrect) {
        Future.delayed(const Duration(seconds: 2), () {
          widget.onLevelComplete();
          setState(() {
            showFeedback = false;
            draggedItem = null;
            droppedItem = null;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final isTablet = MediaQuery.of(context).size.width < 1024;
    final data = levelData[widget.level]!;

    if (isMobile) {
      // Mobile layout - vertical stacking
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              // Scenario Panel
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.brown.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['title'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildInfoCard(
                      'Scenario:',
                      data['scenario'],
                      Colors.orange[50]!,
                      Colors.brown,
                    ),
                    const SizedBox(height: 15),
                    _buildInfoCard(
                      'Conditional Logic:',
                      data['condition'],
                      Colors.green[50]!,
                      Colors.green,
                    ),
                    const SizedBox(height: 15),
                    _buildInfoCard(
                      'Question:',
                      data['question'],
                      Colors.blue[50]!,
                      Colors.blue,
                    ),
                    if (showFeedback) ...[
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: isCorrect ? Colors.green[50] : Colors.red[50],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isCorrect ? 'Correct! 🎉' : 'Not quite right 😢',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: isCorrect ? Colors.green : Colors.red,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              isCorrect
                                  ? data['explanation']
                                  : 'Try again! Drag a different option.',
                              style: const TextStyle(fontSize: 16, height: 1.5),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              // Drag and Drop Area
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.brown.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Chef and Drop Target
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/chef.png',
                              width: 60,
                              height: 60,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.emoji_people,
                                    color: Colors.deepOrange, size: 60);
                              },
                            ),
                            const SizedBox(width: 10),
                            const Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Chef Antonio says:',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.brown,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '"Help me decide what to do!"',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Drop Target for mobile
                        DragTarget<String>(
                          builder: (context, candidateData, rejectedData) {
                            return Container(
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                color: droppedItem == null
                                    ? Colors.grey[100]
                                    : (isCorrect
                                    ? Colors.green[100]
                                    : Colors.red[100]),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: droppedItem == null
                                      ? Colors.grey
                                      : (isCorrect ? Colors.green : Colors.red),
                                  width: 3,
                                ),
                              ),
                              child: Center(
                                child: droppedItem == null
                                    ? const Text(
                                  'Drop decision here!',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                )
                                    : Text(
                                  droppedItem!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isCorrect
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            );
                          },
                          onAccept: (data) {
                            checkAnswer(data);
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Drag the correct decision:',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.brown[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Options for mobile
                    Column(
                      children: (data['options'] as List<String>)
                          .map((option) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Draggable<String>(
                          data: option,
                          feedback: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              width:
                              MediaQuery.of(context).size.width - 60,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.orange[100],
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: Colors.orange, width: 2),
                              ),
                              child: Text(
                                option,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown,
                                ),
                              ),
                            ),
                          ),
                          childWhenDragging: Container(
                            width:
                            MediaQuery.of(context).size.width - 60,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Colors.grey, width: 2),
                            ),
                            child: Text(
                              option,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          child: Container(
                            width:
                            MediaQuery.of(context).size.width - 60,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.orange[100],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Colors.orange, width: 2),
                            ),
                            child: Text(
                              option,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                              ),
                            ),
                          ),
                        ),
                      ))
                          .toList(),
                    ),

                    const SizedBox(height: 25),
                    // Game Controls for mobile
                    Column(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              draggedItem = null;
                              droppedItem = null;
                              showFeedback = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          icon: const Icon(Icons.refresh),
                          label: const Text(
                            'Reset Level',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton.icon(
                          onPressed: widget.onReset,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          icon: const Icon(Icons.restart_alt),
                          label: const Text(
                            'Restart Game',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Desktop/Tablet layout - horizontal
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Panel - Scenario and Instructions
        Expanded(
          flex: isTablet ? 1 : 2,
          child: Container(
            padding: EdgeInsets.all(isTablet ? 15 : 25),
            margin: EdgeInsets.only(right: isTablet ? 15 : 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.brown.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['title'],
                    style: TextStyle(
                      fontSize: isTablet ? 22 : 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildInfoCard(
                    'Scenario:',
                    data['scenario'],
                    Colors.orange[50]!,
                    Colors.brown,
                    isTablet: isTablet,
                  ),
                  SizedBox(height: isTablet ? 15 : 25),
                  _buildInfoCard(
                    'Conditional Logic:',
                    data['condition'],
                    Colors.green[50]!,
                    Colors.green,
                    isTablet: isTablet,
                  ),
                  SizedBox(height: isTablet ? 15 : 25),
                  _buildInfoCard(
                    'Question:',
                    data['question'],
                    Colors.blue[50]!,
                    Colors.blue,
                    isTablet: isTablet,
                  ),
                  if (showFeedback) ...[
                    SizedBox(height: isTablet ? 15 : 25),
                    Container(
                      padding: EdgeInsets.all(isTablet ? 15 : 20),
                      decoration: BoxDecoration(
                        color: isCorrect ? Colors.green[50] : Colors.red[50],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isCorrect ? 'Correct! 🎉' : 'Not quite right 😢',
                            style: TextStyle(
                              fontSize: isTablet ? 18 : 20,
                              fontWeight: FontWeight.bold,
                              color: isCorrect ? Colors.green : Colors.red,
                            ),
                          ),
                          SizedBox(height: isTablet ? 8 : 10),
                          Text(
                            isCorrect
                                ? data['explanation']
                                : 'Try again! Drag a different option.',
                            style: TextStyle(
                              fontSize: isTablet ? 16 : 18,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),

        // Right Panel - Drag and Drop Game
        Expanded(
          flex: isTablet ? 1 : 3,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Kitchen Area
                Container(
                  height: isTablet ? 250 : 300,
                  padding: EdgeInsets.all(isTablet ? 15 : 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.brown.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?auto=format&fit=crop&w=800',
                      ),
                      fit: BoxFit.cover,
                      opacity: 0.1,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/chef.png',
                              width: isTablet ? 80 : 100,
                              height: isTablet ? 80 : 100,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.emoji_people,
                                    color: Colors.deepOrange,
                                    size: isTablet ? 80 : 100);
                              },
                            ),
                            SizedBox(width: isTablet ? 15 : 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Chef Antonio says:',
                                  style: TextStyle(
                                    fontSize: isTablet ? 16 : 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.brown,
                                  ),
                                ),
                                SizedBox(height: isTablet ? 5 : 10),
                                Text(
                                  '"Help me decide what to do!\nDrag the correct answer here."',
                                  style: TextStyle(
                                    fontSize: isTablet ? 14 : 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: isTablet ? 20 : 40),
                        // Drop Target
                        DragTarget<String>(
                          builder: (context, candidateData, rejectedData) {
                            return Container(
                              width: double.infinity,
                              height: isTablet ? 80 : 100,
                              decoration: BoxDecoration(
                                color: droppedItem == null
                                    ? Colors.grey[100]
                                    : (isCorrect
                                    ? Colors.green[100]
                                    : Colors.red[100]),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: droppedItem == null
                                      ? Colors.grey
                                      : (isCorrect ? Colors.green : Colors.red),
                                  width: 3,
                                ),
                              ),
                              child: Center(
                                child: droppedItem == null
                                    ? Text(
                                  'Drop your decision here!',
                                  style: TextStyle(
                                    fontSize: isTablet ? 16 : 20,
                                    color: Colors.grey,
                                  ),
                                )
                                    : Text(
                                  droppedItem!,
                                  style: TextStyle(
                                    fontSize: isTablet ? 16 : 20,
                                    fontWeight: FontWeight.bold,
                                    color: isCorrect
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          },
                          onAccept: (data) {
                            checkAnswer(data);
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: isTablet ? 20 : 30),

                // Decision Options
                Text(
                  'Drag the correct decision to the box above:',
                  style: TextStyle(
                    fontSize: isTablet ? 16 : 18,
                    color: Colors.brown[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: isTablet ? 15 : 20),

                Wrap(
                  spacing: isTablet ? 10 : 20,
                  runSpacing: isTablet ? 10 : 20,
                  alignment: WrapAlignment.center,
                  children: (data['options'] as List<String>).map((option) {
                    return Draggable<String>(
                      data: option,
                      feedback: Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: isTablet ? 200 : 250,
                          ),
                          padding: EdgeInsets.all(isTablet ? 15 : 20),
                          decoration: BoxDecoration(
                            color: Colors.orange[100],
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.orange, width: 2),
                          ),
                          child: Text(
                            option,
                            style: TextStyle(
                              fontSize: isTablet ? 14 : 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown,
                            ),
                          ),
                        ),
                      ),
                      childWhenDragging: Container(
                        constraints: BoxConstraints(
                          maxWidth: isTablet ? 200 : 250,
                        ),
                        padding: EdgeInsets.all(isTablet ? 15 : 20),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey, width: 2),
                        ),
                        child: Text(
                          option,
                          style: TextStyle(
                            fontSize: isTablet ? 14 : 18,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: isTablet ? 200 : 250,
                        ),
                        padding: EdgeInsets.all(isTablet ? 15 : 20),
                        decoration: BoxDecoration(
                          color: Colors.orange[100],
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.orange, width: 2),
                        ),
                        child: Text(
                          option,
                          style: TextStyle(
                            fontSize: isTablet ? 14 : 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                SizedBox(height: isTablet ? 25 : 40),

                // Game Controls
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          draggedItem = null;
                          droppedItem = null;
                          showFeedback = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: isTablet ? 20 : 25,
                          vertical: isTablet ? 12 : 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      icon: const Icon(Icons.refresh, color: Colors.white),
                      label: Text(
                        'Reset Level',
                        style: TextStyle(fontSize: isTablet ? 14 : 18),
                      ),
                    ),
                    SizedBox(width: isTablet ? 15 : 20),
                    ElevatedButton.icon(
                      onPressed: widget.onReset,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: isTablet ? 20 : 25,
                          vertical: isTablet ? 12 : 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      icon: const Icon(Icons.restart_alt, color: Colors.white),
                      label: Text(
                        'Restart Game',
                        style: TextStyle(fontSize: isTablet ? 14 : 18),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard(String title, String content, Color bgColor,
      Color titleColor, {bool isTablet = false}) {
    return Container(
      padding: EdgeInsets.all(isTablet ? 15 : 20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isTablet ? 16 : 20,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
          SizedBox(height: isTablet ? 8 : 10),
          Text(
            content,
            style: TextStyle(
              fontSize: isTablet ? 14 : 18,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}


