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
        showScoreDialog();
      }
    });
  }

  void resetGame() {
    setState(() {
      showScoreDialog(isReset: true);
    });
  }

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
                      showTutorial = true;
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
            // Header
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
                    : PizzaOrderScreen(
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
                'Welcome to Bodas Pizza!',
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
                      color: Colors.deepOrange, size: isMobile ? 100 : 150);
                },
              ),
              SizedBox(height: isMobile ? 20 : 30),
              Text(
                'Help customers order their perfect pizza!',
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
                      '1. Read the customer\'s button presses\n'
                          '2. Match the button sequence to the correct order\n'
                          '3. Drag the correct conditional logic to build the order\n'
                          '4. Help prepare the perfect pizza every time!',
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 18,
                        height: 1.6,
                      ),
                    ),
                    SizedBox(height: isMobile ? 10 : 15),
                    Text(
                      'Button Guide:\n'
                          '• 1 = Pizza, 2 = Tacos\n'
                          '• 0 = Small, 1 = Medium, 2 = Large, 3 = Extra Large\n'
                          '• 0 = No Extra Cheese, 1 = Extra Cheese\n'
                          '• 0 = Takeaway, 2 = Eat in Restaurant',
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 16,
                        height: 1.6,
                        color: Colors.brown,
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
                  'Start Taking Orders!',
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

class PizzaOrderScreen extends StatefulWidget {
  final int level;
  final VoidCallback onLevelComplete;
  final VoidCallback onReset;

  const PizzaOrderScreen({
    super.key,
    required this.level,
    required this.onLevelComplete,
    required this.onReset,
  });

  @override
  State<PizzaOrderScreen> createState() => _PizzaOrderScreenState();
}

class _PizzaOrderScreenState extends State<PizzaOrderScreen> {
  String? draggedItem;
  String? droppedItem;
  bool isCorrect = false;
  bool showFeedback = false;

  final Map<int, Map<String, dynamic>> levelData = {
    1: {
      'title': 'Level 1: Client 1 Order',
      'scenario':
      'Client 1 pressed: 1, then 0, then 1, then 2.\n\nWhat is the correct order?',
      'condition': 'Order Options (Choose the correct one):',
      'question': 'Drag the correct order to the receipt:',
      'options': [
        'A) Small Pizza with Extra Cheese to eat In Restaurant',
        'B) Medium Pizza with No Extra Cheese for Takeaway',
        'C) Large Tacos with Extra Cheese to eat In Restaurant',
        'D) Small Tacos with No Extra Cheese for Takeaway',
        'E) Extra Large Pizza with Extra Cheese for Takeaway',
        'F) Medium Tacos with Extra Cheese to eat In Restaurant',
      ],
      'correctAnswer': 'A) Small Pizza with Extra Cheese to eat In Restaurant',
      'explanation':
      '✅ Correct! The button sequence 1-0-1-2 means:\n• 1 = Pizza\n• 0 = Small\n• 1 = Extra Cheese\n• 2 = Eat in Restaurant\n\nThis is like programming logic: IF button1 == 1 THEN item = "Pizza"',
      'orderDisplay': '✅ Client 1 Order: Small Pizza with Extra Cheese to eat In Restaurant',
      'buttonSequence': 'Button Sequence: 1 → 0 → 1 → 2',
    },
    2: {
      'title': 'Level 2: Client 2 Order',
      'scenario':
      'Client 2 pressed: 2, then 2, then 0, then 0.\n\nWhat is the correct order?',
      'condition': 'Order Options (Choose the correct one):',
      'question': 'Drag the correct order to the receipt:',
      'options': [
        'A) Small Pizza with Extra Cheese to eat In Restaurant',
        'B) Large Tacos with No Extra Cheese for Takeaway',
        'C) Medium Pizza with No Extra Cheese for Takeaway',
        'D) Extra Large Tacos with Extra Cheese to eat In Restaurant',
        'E) Medium Tacos with No Extra Cheese to eat In Restaurant',
        'F) Small Tacos with Extra Cheese for Takeaway',
      ],
      'correctAnswer': 'B) Large Tacos with No Extra Cheese for Takeaway',
      'explanation':
      '✅ Perfect! The button sequence 2-2-0-0 means:\n• 2 = Tacos\n• 2 = Large\n• 0 = No Extra Cheese\n• 0 = Takeaway\n\nThis uses ELSE IF logic: IF button1 == 1 THEN pizza ELSE IF button1 == 2 THEN tacos',
      'orderDisplay': '✅ Client 2 Order: Large Tacos with No Extra Cheese for Takeaway',
      'buttonSequence': 'Button Sequence: 2 → 2 → 0 → 0',
    },
    3: {
      'title': 'Level 3: Client 3 Order',
      'scenario':
      'Client 3 pressed: 1, then 3, then 1, then 0.\n\nWhat is the correct order?',
      'condition': 'Order Options (Choose the correct one):',
      'question': 'Drag the correct order to the receipt:',
      'options': [
        'A) Small Pizza with No Extra Cheese to eat In Restaurant',
        'B) Extra Large Pizza with Extra Cheese for Takeaway',
        'C) Medium Tacos with Extra Cheese to eat In Restaurant',
        'D) Large Pizza with Extra Cheese for Takeaway',
        'E) Small Tacos with No Extra Cheese to eat In Restaurant',
        'F) Extra Large Tacos with Extra Cheese for Takeaway',
      ],
      'correctAnswer': 'B) Extra Large Pizza with Extra Cheese for Takeaway',
      'explanation':
      '✅ Excellent! The button sequence 1-3-1-0 means:\n• 1 = Pizza\n• 3 = Extra Large\n• 1 = Extra Cheese\n• 0 = Takeaway\n\nThis demonstrates complex conditionals:\nIF size == 0 THEN "Small"\nELSE IF size == 1 THEN "Medium"\nELSE IF size == 2 THEN "Large"\nELSE "Extra Large"',
      'orderDisplay': '✅ Client 3 Order: Extra Large Pizza with Extra Cheese for Takeaway',
      'buttonSequence': 'Button Sequence: 1 → 3 → 1 → 0',
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
      // Mobile layout
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
                      'Customer Order:',
                      data['scenario'],
                      Colors.orange[50]!,
                      Colors.brown,
                    ),
                    const SizedBox(height: 10),
                    _buildInfoCard(
                      data['buttonSequence'],
                      'Decode the sequence to build the order',
                      Colors.blue[50]!,
                      Colors.blue,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      data['question'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
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
                              isCorrect ? 'Correct Order! 🍕' : 'Wrong Order 😢',
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
                                  : 'Try again! The customer will be unhappy with the wrong order.',
                              style: const TextStyle(fontSize: 16, height: 1.5),
                            ),
                            if (isCorrect) ...[
                              const SizedBox(height: 10),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.green[50],
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.green, width: 2),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      '✅ CORRECT ORDER!',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      data['orderDisplay'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.brown,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              // Order Receipt Area
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
                    // Receipt Header
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.receipt, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            'BODAS PIZZA RECEIPT',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Drop Target for Receipt
                    DragTarget<String>(
                      builder: (context, candidateData, rejectedData) {
                        return Container(
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                            color: droppedItem == null
                                ? Colors.grey[50]
                                : (isCorrect ? Colors.green[50] : Colors.red[50]),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: droppedItem == null
                                  ? Colors.grey
                                  : (isCorrect ? Colors.green : Colors.red),
                              width: 3,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Center(
                            child: droppedItem == null
                                ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.upload,
                                    color: Colors.grey, size: 30),
                                const SizedBox(height: 8),
                                const Text(
                                  'Drag Order Here',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            )
                                : Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                droppedItem!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isCorrect
                                      ? Colors.green
                                      : Colors.red,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        );
                      },
                      onAccept: (data) {
                        checkAnswer(data);
                      },
                    ),

                    const SizedBox(height: 25),
                    Text(
                      'Available Orders:',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.brown[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Order Options
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
                              border:
                              Border.all(color: Colors.grey, width: 2),
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
                    // Game Controls
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
                            'Clear Receipt',
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
                            'Restaurant Closed',
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

    // Desktop/Tablet layout
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Panel - Order Information
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
                    'Customer Button Presses:',
                    data['scenario'],
                    Colors.orange[50]!,
                    Colors.brown,
                    isTablet: isTablet,
                  ),
                  SizedBox(height: isTablet ? 15 : 25),
                  Container(
                    padding: EdgeInsets.all(isTablet ? 15 : 20),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Guide:',
                          style: TextStyle(
                            fontSize: isTablet ? 16 : 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(height: isTablet ? 8 : 10),
                        Text(
                          'Welcome to Bodas Pizza! If you are hungry, you can order a delicious meal by choosing from our menu. Press 1 to order a pizza or 2 to order tacos. After that, select the size you want: press 0 for small, 1 for medium, 2 for large, or 3 for extra large. Do you want extra cheese? Press 0 for no extra cheese or 1 for extra cheese. Finally, decide if you want to eat here or take your order away: press 0 for takeaway or 2 to eat in the restaurant. Once you finish all your choices, your full order will be displayed so you can confirm it.',
                          style: TextStyle(
                            fontSize: isTablet ? 14 : 18,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: isTablet ? 15 : 25),
                  Text(
                    data['question'],
                    style: TextStyle(
                      fontSize: isTablet ? 16 : 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
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
                            isCorrect ? 'Order Accepted! 🎯' : 'Order Rejected ❌',
                            style: TextStyle(
                              fontSize: isTablet ? 18 : 22,
                              fontWeight: FontWeight.bold,
                              color: isCorrect ? Colors.green : Colors.red,
                            ),
                          ),
                          SizedBox(height: isTablet ? 8 : 10),
                          Text(
                            isCorrect
                                ? data['explanation']
                                : 'That\'s not what the customer ordered! Try again.',
                            style: TextStyle(
                              fontSize: isTablet ? 16 : 18,
                              height: 1.5,
                            ),
                          ),
                          if (isCorrect) ...[
                            SizedBox(height: isTablet ? 10 : 15),
                            Container(
                              padding: EdgeInsets.all(isTablet ? 12 : 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.green),
                              ),
                              child: Text(
                                data['orderDisplay'],
                                style: TextStyle(
                                  fontSize: isTablet ? 16 : 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),

        // Right Panel - Order Processing
        Expanded(
          flex: isTablet ? 1 : 3,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Restaurant Scene
                Container(
                  height: isTablet ? 200 : 250,
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
                        'https://images.unsplash.com/photo-1604068549290-dea0e4a305ca?auto=format&fit=crop&w=800',
                      ),
                      fit: BoxFit.cover,
                      opacity: 0.1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/chef.png',
                            width: isTablet ? 60 : 80,
                            height: isTablet ? 60 : 80,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.emoji_people,
                                  color: Colors.deepOrange,
                                  size: isTablet ? 60 : 80);
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
                                '"Match the button sequence\nto prepare the correct order!"',
                                style: TextStyle(
                                  fontSize: isTablet ? 14 : 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: isTablet ? 20 : 30),
                      Text(
                        data['buttonSequence'],
                        style: TextStyle(
                          fontSize: isTablet ? 18 : 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: isTablet ? 20 : 30),

                // Receipt Area
                Container(
                  padding: EdgeInsets.all(isTablet ? 20 : 30),
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
                  child: Column(
                    children: [
                      // Receipt
                      Container(
                        padding: EdgeInsets.all(isTablet ? 15 : 20),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: droppedItem == null
                                ? Colors.grey[400]!  // Add ! to make it non-nullable
                                : (isCorrect ? Colors.green : Colors.red),
                            width: 2,
                            style: BorderStyle.solid,  // Changed from 'dashed' to 'solid'
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '=== BODAS PIZZA ===',
                              style: TextStyle(
                                fontSize: isTablet ? 18 : 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange,
                              ),
                            ),
                            SizedBox(height: isTablet ? 15 : 20),
                            DragTarget<String>(
                              builder: (context, candidateData, rejectedData) {
                                return Container(
                                  width: double.infinity,
                                  height: isTablet ? 100 : 120,
                                  decoration: BoxDecoration(
                                    color: droppedItem == null
                                        ? Colors.white
                                        : (isCorrect
                                        ? Colors.green[50]
                                        : Colors.red[50]),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: droppedItem == null
                                          ? Colors.grey[400]!  // Add ! to make it non-nullable
                                          : (isCorrect ? Colors.green : Colors.red),
                                      width: 2,
                                      style: BorderStyle.solid,  // Changed from 'dashed' to 'solid'
                                    ),
                                  ),
                                  child: Center(
                                    child: droppedItem == null
                                        ? Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.receipt_long,
                                            color: Colors.grey,
                                            size: 30),
                                        SizedBox(height: 8),
                                        Text(
                                          'Drag Order Here',
                                          style: TextStyle(
                                            fontSize: isTablet ? 14 : 16,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    )
                                        : Padding(
                                      padding: EdgeInsets.all(
                                          isTablet ? 10 : 15),
                                      child: Text(
                                        droppedItem!,
                                        style: TextStyle(
                                          fontSize: isTablet ? 14 : 18,
                                          fontWeight: FontWeight.bold,
                                          color: isCorrect
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              onAccept: (data) {
                                checkAnswer(data);
                              },
                            ),
                            SizedBox(height: isTablet ? 15 : 20),
                            Text(
                              'Thank you for your order!',
                              style: TextStyle(
                                fontSize: isTablet ? 14 : 16,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: isTablet ? 20 : 30),

                      Text(
                        'Available Orders:',
                        style: TextStyle(
                          fontSize: isTablet ? 16 : 20,
                          color: Colors.brown[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: isTablet ? 15 : 20),

                      // Order Options
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
                                  border:
                                  Border.all(color: Colors.orange, width: 2),
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
                                border:
                                Border.all(color: Colors.orange, width: 2),
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
                              'Clear Receipt',
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
                            icon: const Icon(Icons.restart_alt,
                                color: Colors.white),
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
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard(String title, String content, Color bgColor,
      Color titleColor,
      {bool isTablet = false}) {
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


