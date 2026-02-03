import 'package:flutter/material.dart';

class GameHomeScreen extends StatefulWidget {
  const GameHomeScreen({super.key});

  @override
  State<GameHomeScreen> createState() => _GameHomeScreenState();
}

class _GameHomeScreenState extends State<GameHomeScreen> {
  int currentLevel = 1;
  bool showTutorial = true;

  void startGame() {
    setState(() {
      showTutorial = false;
    });
  }
  void resetGame() {
    setState(() {
      showScoreDialog(isReset: true);
    });
  }

  void levelComplete() {
    setState(() {
      if (currentLevel < 3) {
        currentLevel++;
      } else {
        showScoreDialog();
      }
    });
  }

  void showScoreDialog({bool isReset = false}) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final isTablet = MediaQuery.of(context).size.width < 1024;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        backgroundColor: Colors.white,
        insetPadding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 40,
          vertical: 20,
        ),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: isMobile
                ? 400
                : isTablet
                ? 500
                : MediaQuery.of(context).size.width * 3 / 5, // 3/5 for PC
            maxHeight: 600,
          ),
          padding: EdgeInsets.all(isMobile ? 20 : 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isReset ? 'Game Restarted' : 'Game Completed!',
                style: TextStyle(
                  fontSize: isMobile ? 22 : (isTablet ? 26 : 30),
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                  fontFamily: 'ComicNeue',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: isMobile ? 20 : 25),
              Icon(
                Icons.emoji_events,
                color: Colors.orange[400],
                size: isMobile ? 60 : 70,
              ),
              SizedBox(height: isMobile ? 15 : 20),
              Container(
                padding: EdgeInsets.all(isMobile ? 15 : 20),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text(
                      isReset
                          ? 'Game has been restarted!'
                          : 'Congratulations! You completed all levels!',
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 18,
                        color: Colors.brown[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: isMobile ? 20 : 30),
              Text(
                isReset
                    ? 'Are you ready to start again?'
                    : 'Thank you for playing Pizza Conditionals!',
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18,
                  color: Colors.grey[700],
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: isMobile ? 25 : 35),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      currentLevel = 1;
                      showTutorial = true;
                    });
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      vertical: isMobile ? 15 : 18,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    isReset ? 'PLAY AGAIN' : 'NEW GAME',
                    style: TextStyle(
                      fontSize: isMobile ? 18 : 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              if (!isReset) SizedBox(height: isMobile ? 15 : 20),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
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
                          Text(
                            'Pizza Game',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'ComicNeue',
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
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
                        'Pizza Game',
                        style: TextStyle(
                          fontSize: isTablet ? 24 : 26,
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
                      'Follow the customer instructions and use the correct rules to serve the perfect pizza order every time.',
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
  bool showNextButton = false;
  bool answerLocked = false;
  final ScrollController _scrollController = ScrollController();

  final Map<int, Map<String, dynamic>> levelData = {
    1: {
      'title': 'Level 1: Client 1 Order',
      'scenario': 'Client 1 pressed: 1, then 0, then 1, then 2.',
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
      'scenario': 'Client 2 pressed: 2, then 2, then 0, then 0.',
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
      'scenario': 'Client 3 pressed: 1, then 3, then 1, then 0.',
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
    var isMobile = MediaQuery.of(context).size.width < 768;
    setState(() {
      droppedItem = answer;
      isCorrect = answer == levelData[widget.level]!['correctAnswer'];
      showFeedback = true;
      answerLocked = true;

      if (isCorrect) {
        showNextButton = true;

        // Scroll to explanation after a brief delay
        if(!isMobile){
          Future.delayed(const Duration(milliseconds: 300), () {
            if (_scrollController.hasClients) {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            }
          });
        }
      }
    });
  }

  void proceedToNextLevel() {
    setState(() {
      showFeedback = false;
      showNextButton = false;
      answerLocked = false;
      draggedItem = null;
      droppedItem = null;
    });
    widget.onLevelComplete();
  }

  void clearAnswer() {
    setState(() {
      draggedItem = null;
      droppedItem = null;
      showFeedback = false;
      showNextButton = false;
      answerLocked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final isTablet = MediaQuery.of(context).size.width < 1024;
    final data = levelData[widget.level]!;

    if (isMobile) {
      // MOBILE LAYOUT - Stacked/Column Layout
      return SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Order Information Card
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
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
                  const SizedBox(height: 12),
                  _buildInfoCard(
                    'Customer Button Presses:',
                    data['scenario'],
                    Colors.orange[50]!,
                    Colors.brown,
                    isMobile: true,
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Guide:',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Welcome to Bodas Pizza! If you are hungry, you can order a delicious meal by choosing from our menu. Press 1 to order a pizza or 2 to order tacos. After that, select the size you want: press 0 for small, 1 for medium, 2 for large, or 3 for extra large. Do you want extra cheese? Press 0 for no extra cheese or 1 for extra cheese. Finally, decide if you want to eat here or take your order away: press 0 for takeaway or 2 to eat in the restaurant. Once you finish all your choices, your full order will be displayed so you can confirm it.',
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    data['question'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  if (showFeedback) ...[
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isCorrect ? Colors.green[50] : Colors.red[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isCorrect ? 'Order Accepted! 🎯' : 'Order Rejected ❌',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isCorrect ? Colors.green : Colors.red,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            isCorrect
                                ? data['explanation']
                                : 'That\'s not what the customer ordered! Try again.',
                            style: const TextStyle(
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                          if (isCorrect) ...[
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.green),
                              ),
                              child: Text(
                                data['orderDisplay'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 12),
                            if (showNextButton)
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: proceedToNextLevel,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(vertical: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  child: Text(
                                    widget.level < 3 ? 'NEXT LEVEL' : 'FINISH GAME',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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

            // Order Processing Area
            Container(
              padding: const EdgeInsets.all(16),
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
                  // Receipt Area
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: droppedItem == null
                            ? Colors.grey[400]!
                            : (isCorrect ? Colors.green : Colors.red),
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'BODAS PIZZA',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                        const SizedBox(height: 12),
                        DragTarget<String>(
                          builder: (context, candidateData, rejectedData) {
                            return Container(
                              width: double.infinity,
                              height: 100,
                              decoration: BoxDecoration(
                                color: droppedItem == null
                                    ? Colors.white
                                    : (isCorrect
                                    ? Colors.green[50]
                                    : Colors.red[50]),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: droppedItem == null
                                      ? Colors.grey[400]!
                                      : (isCorrect ? Colors.green : Colors.red),
                                  width: 2,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Center(
                                child: droppedItem == null
                                    ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.receipt_long,
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
                                      color: isCorrect ? Colors.green : Colors.red,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            );
                          },
                          onWillAccept: (data) {
                            // Don't accept new items if answer is locked (correct answer already given)
                            return !answerLocked;
                          },
                          onAccept: (data) {
                            checkAnswer(data);
                          },
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Thank you for your order!',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    'Available Orders:',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.brown[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Order Options - Single column for mobile
                  Column(
                    children: (data['options'] as List<String>)
                        .map((option) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: answerLocked
                          ? Container(
                        width: MediaQuery.of(context).size.width - 60,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey, width: 2),
                        ),
                        child: Text(
                          option,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                          : Draggable<String>(
                        data: option,
                        feedback: Material(
                          elevation: 8,
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 60,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.orange[100],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.orange, width: 2),
                            ),
                            child: Text(
                              option,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                              ),
                            ),
                          ),
                        ),
                        childWhenDragging: Container(
                          width: MediaQuery.of(context).size.width - 60,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey, width: 2),
                          ),
                          child: Text(
                            option,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 60,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.orange[100],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.orange, width: 2),
                          ),
                          child: Text(
                            option,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown,
                            ),
                          ),
                        ),
                      ),
                    ))
                        .toList(),
                  ),

                  const SizedBox(height: 20),

                  // Game Controls - Column for mobile
                  Column(
                    children: [
                      ElevatedButton.icon(
                        onPressed: answerLocked ? null : clearAnswer,
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
      );
    }

    // TABLET/DESKTOP LAYOUT - Side-by-side Row Layout
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
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['title'],
                    style: TextStyle(
                      fontSize: isTablet ? 22 : 24,
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
                  SizedBox(height: isTablet ? 16 : 20),
                  Container(
                    padding: EdgeInsets.all(isTablet ? 14 : 16),
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
                            fontSize: isTablet ? 18 : 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(height: isTablet ? 5 : 5),
                        Text(
                          'Welcome to Bodas Pizza! If you are hungry, you can order a delicious meal by choosing from our menu. Press 1 to order a pizza or 2 to order tacos. After that, select the size you want: press 0 for small, 1 for medium, 2 for large, or 3 for extra large. Do you want extra cheese? Press 0 for no extra cheese or 1 for extra cheese. Finally, decide if you want to eat here or take your order away: press 0 for takeaway or 2 to eat in the restaurant. Once you finish all your choices, your full order will be displayed so you can confirm it.',
                          style: TextStyle(
                            fontSize: isTablet ? 16 : 16,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: isTablet ? 16 : 20),
                  Text(
                    data['question'],
                    style: TextStyle(
                      fontSize: isTablet ? 18 : 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  if (showFeedback) ...[
                    SizedBox(height: isTablet ? 20 : 25),
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
                          SizedBox(height: isTablet ? 10 : 12),
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
                            SizedBox(height: isTablet ? 15 : 20),
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
                            SizedBox(height: isTablet ? 15 : 20),
                            if (showNextButton)
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: proceedToNextLevel,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                      vertical: isTablet ? 15 : 18,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    elevation: 5,
                                  ),
                                  child: Text(
                                    widget.level < 3 ? 'NEXT LEVEL →' : 'FINISH GAME 🏆',
                                    style: TextStyle(
                                      fontSize: isTablet ? 16 : 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
                                ? Colors.grey[400]!
                                : (isCorrect ? Colors.green : Colors.red),
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'BODAS PIZZA',
                              style: TextStyle(
                                fontSize: isTablet ? 18 : 20,
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
                                          ? Colors.grey[400]!
                                          : (isCorrect ? Colors.green : Colors.red),
                                      width: 2,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  child: Center(
                                    child: droppedItem == null
                                        ? Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.receipt_long,
                                            color: Colors.grey, size: 30),
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
                                      padding: EdgeInsets.all(isTablet ? 10 : 15),
                                      child: Text(
                                        droppedItem!,
                                        style: TextStyle(
                                          fontSize: isTablet ? 14 : 18,
                                          fontWeight: FontWeight.bold,
                                          color: isCorrect ? Colors.green : Colors.red,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              onWillAccept: (data) {
                                // Don't accept new items if answer is locked
                                return !answerLocked;
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

                      // Order Options - Wrap for tablet/desktop
                      Wrap(
                        spacing: isTablet ? 10 : 20,
                        runSpacing: isTablet ? 10 : 20,
                        alignment: WrapAlignment.center,
                        children: (data['options'] as List<String>).map((option) {
                          return answerLocked
                              ? Container(
                            constraints: BoxConstraints(
                              maxWidth: isTablet ? 200 : 250,
                            ),
                            padding: EdgeInsets.all(isTablet ? 15 : 20),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey, width: 2),
                            ),
                            child: Text(
                              option,
                              style: TextStyle(
                                fontSize: isTablet ? 14 : 18,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                              : Draggable<String>(
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

                      // Game Controls - Row for tablet/desktop
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: answerLocked ? null : clearAnswer,
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
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard(String title, String content, Color bgColor,
      Color titleColor,
      {bool isMobile = false, bool isTablet = false}) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 12 : (isTablet ? 15 : 20)),
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
              fontSize: isMobile ? 17 : (isTablet ? 18 : 18),
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
          SizedBox(height: isMobile ? 4 : (isTablet ? 5 : 5)),
          Text(
            content,
            style: TextStyle(
              fontSize: isMobile ? 15 : (isTablet ? 16 : 16),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

