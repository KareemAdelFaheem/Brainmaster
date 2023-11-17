class questionlist {
  int _questionindex = 0;
  int _totalscore = 0;

  int getScore() {
    return _totalscore;
  }

  void zeroScore() {
    _totalscore = 0;
  }

  

  int getIndex() {
    return _questionindex;
  }

  void setIndex() {
    _questionindex++;
  }
  void outofboundIndex() {
    
    _questionindex=12;
  }

  void zeroIndex() {
    _questionindex = 0;
  }

  final questions = [
    {
      'questiontext': 'What is the name of the tallest mountain in the world?',
      'answers': [
        {'text': 'Mount Everest', 'score': 1},
        {'text': 'Mount Joe', 'score': 0},
        {'text': 'Mount moSalah', 'score': 0},
        {'text': 'Mount Sankatrien', 'score': 0}
      ],
    },
    {
      'questiontext': 'Which country has the largest population in the world?',
      'answers': [
        {'text': 'Egypt', 'score': 0},
        {'text': 'China', 'score': 1},
        {'text': 'America', 'score': 0},
        {'text': 'Netherland', 'score': 0},
      ],
    },
    {
      'questiontext':
          'What are the names of the seven continents of the world?',
      'answers': [
        {'text': 'Africa', 'score': 0},
        {'text': 'Australia', 'score': 0},
        {'text': 'America', 'score': 0},
        {'text': 'Asia', 'score': 1},
      ],
    },
    {
      'questiontext': 'What are the names of the five oceans of the world?',
      'answers': [
        {'text': 'Pacific', 'score': 1},
        {'text': 'Atlants', 'score': 0},
        {'text': 'Atlantino', 'score': 0},
        {'text': 'Specific', 'score': 0},
      ],
    },
    {
      'questiontext': 'What is the name of the longest river in Africa?',
      'answers': [
        {'text': 'America river', 'score': 0},
        {'text': 'Amazon river', 'score': 0},
        {'text': 'Nile river', 'score': 1},
        {'text': 'China river', 'score': 0},
      ],
    },
    {
      'questiontext':
          'What American city is the Golden Gate Bridge located in?',
      'answers': [
        {'text': 'Florida', 'score': 0},
        {'text': 'San francisco', 'score': 1},
        {'text': 'Cairo', 'score': 0},
        {'text': 'India', 'score': 0},
      ],
    },
    {
      'questiontext': 'What is the capital of Mexico?',
      'answers': [
        {'text': 'Mexican', 'score': 0},
        {'text': 'Mexico City', 'score': 1},
        {'text': 'Cairo', 'score': 0},
        {'text': 'Ottawa', 'score': 0},
      ],
    },
    {
      'questiontext': 'What is the name of the largest country in the world?',
      'answers': [
        {'text': 'Russia', 'score': 1},
        {'text': 'Egypt', 'score': 0},
        {'text': 'China', 'score': 0},
        {'text': 'Japan', 'score': 0},
      ],
    },
    {
      'questiontext':
          'What U.S. state is home to no documented poisonous snakes?',
      'answers': [
        {'text': 'Florida', 'score': 0},
        {'text': 'Alaska', 'score': 1},
        {'text': 'Los angelos', 'score': 0},
        {'text': 'San francisco', 'score': 0},
      ],
    },
    {
      'questiontext': 'Where is the Eiffel Tower located?',
      'answers': [
        {'text': 'Egypt', 'score': 0},
        {'text': 'China', 'score': 0},
        {'text': 'Japan', 'score': 0},
        {'text': 'Paris', 'score': 1},
      ],
    },
    {
      'questiontext': 'What is the capital of Canada?',
      'answers': [
        {'text': 'Cairo', 'score': 0},
        {'text': 'Canada', 'score': 0},
        {'text': 'Ottawa', 'score': 1},
        {'text': 'Niger', 'score': 0},
      ],
    },
    {
      'questiontext': 'What is the name of the largest ocean in the world?',
      'answers': [
        {'text': 'Atlantis', 'score': 0},
        {'text': 'Pacific ocean', 'score': 1},
        {'text': 'Specific', 'score': 0},
        {'text': 'Longer Ocean', 'score': 0},
      ],
    },
    {
      'questiontext':
          'What present-day Italian city does Mt. Vesuvius overlook?',
      'answers': [
        {'text': 'Naples', 'score': 1},
        {'text': 'Italiano', 'score': 0},
        {'text': 'Mano', 'score': 0},
        {'text': 'Italy', 'score': 0},
      ],
    },
  ];
  void setScore(int score) {
    if(_totalscore<questions.length)
    {
      _totalscore += score;
    }
    
  }
}
