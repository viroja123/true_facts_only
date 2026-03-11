class Fact {
  final String id;
  final String content;
  final String category;

  Fact({required this.id, required this.content, required this.category});

  factory Fact.fromJson(Map<String, dynamic> json) {
    return Fact(
      id: json['id'],
      content: json['content'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'content': content, 'category': category};
  }
}

// New extensive dummy data
final List<Fact> allFacts = [
  // Animals
  Fact(
    id: '1',
    category: 'Animal',
    content: 'Sloths can hold their breath longer than dolphins can.',
  ),
  Fact(id: '16', category: 'Animal', content: 'Octopuses have three hearts.'),
  Fact(
    id: '19',
    category: 'Animal',
    content: 'Cows have best friends and get stressed when separated.',
  ),
  Fact(
    id: '20',
    category: 'Animal',
    content: 'A shrimp\'s heart is located in its head.',
  ),
  Fact(
    id: '21',
    category: 'Animal',
    content: 'Elephants are the only animal that can\'t jump.',
  ),

  // Apple
  Fact(
    id: '2',
    category: 'Apple',
    content:
        'Apple was originally founded by three people, not two. (Steve Jobs, Steve Wozniak, and Ronald Wayne)',
  ),
  Fact(
    id: '22',
    category: 'Apple',
    content:
        'If you use an iPhone in a movie, you are usually a good guy (Apple doesn\'t let villains use their products on screen).',
  ),
  Fact(
    id: '23',
    category: 'Apple',
    content: 'Apple earns around \$4,000 every single second.',
  ),
  Fact(
    id: '24',
    category: 'Apple',
    content: 'The first Apple computer screen was actually a television.',
  ),

  // Art
  Fact(
    id: '3',
    category: 'Art',
    content:
        'Leonardo da Vinci could write with one hand and draw with the other at the same time.',
  ),
  Fact(
    id: '25',
    category: 'Art',
    content: 'Roman statues were actually made to have detachable heads.',
  ),
  Fact(
    id: '26',
    category: 'Art',
    content:
        'Picasso could draw before he could walk, and his first word was the Spanish word for pencil.',
  ),
  Fact(
    id: '27',
    category: 'Art',
    content: 'The Mona Lisa has no eyebrows or eyelashes.',
  ),

  // Australia
  Fact(
    id: '4',
    category: 'Austrailia',
    content: 'Australia is wider than the moon.',
  ),
  Fact(
    id: '28',
    category: 'Austrailia',
    content: 'There are more kangaroos in Australia than there are humans.',
  ),
  Fact(
    id: '29',
    category: 'Austrailia',
    content:
        'Australia has the world\'s longest golf course, measuring more than 850 miles long.',
  ),
  Fact(
    id: '30',
    category: 'Austrailia',
    content: 'The Australian Alps get more snow than the Swiss Alps.',
  ),

  // Babies
  Fact(
    id: '5',
    category: 'Babies',
    content:
        'Babies are born with 300 bones, but by adulthood, we have only 206.',
  ),
  Fact(
    id: '31',
    category: 'Babies',
    content: 'Babies don\'t shed tears until they are at least one month old.',
  ),
  Fact(
    id: '32',
    category: 'Babies',
    content:
        'A baby\'s fingerprints are formed by the time they are three months pregnant in the womb.',
  ),
  Fact(
    id: '33',
    category: 'Babies',
    content: 'Newborns can only see in black, white, and gray.',
  ),

  // Brain
  Fact(
    id: '6',
    category: 'brain',
    content:
        'Your brain generates enough electricity to power a small light bulb.',
  ),
  Fact(
    id: '34',
    category: 'brain',
    content: 'The human brain is composed of nearly 60% fat.',
  ),
  Fact(
    id: '35',
    category: 'brain',
    content:
        'Brain information travels up to an impressive 268 miles per hour.',
  ),
  Fact(
    id: '36',
    category: 'brain',
    content: 'Your brain uses 20% of the total oxygen in your body.',
  ),

  // Cars
  Fact(
    id: '7',
    category: 'cars',
    content: 'The first person ever to get a speeding ticket was going 8 mph.',
  ),
  Fact(
    id: '37',
    category: 'cars',
    content:
        'It would take approximately six months to drive to the moon at 60 mph.',
  ),
  Fact(
    id: '38',
    category: 'cars',
    content:
        'There are currently more than 1 billion cars currently in use on earth.',
  ),
  Fact(
    id: '39',
    category: 'cars',
    content: 'The world\'s first automobile accident occurred in 1891 in Ohio.',
  ),

  // Cats & Dogs
  Fact(
    id: '8',
    category: 'Cat_Dogs',
    content:
        'A cat\'s purr has been shown to improve bone density and promote healing.',
  ),
  Fact(
    id: '40',
    category: 'Cat_Dogs',
    content: 'Dogs\' sense of smell is at least 40x better than ours.',
  ),
  Fact(id: '41', category: 'Cat_Dogs', content: 'Cats can\'t taste sweetness.'),
  Fact(
    id: '42',
    category: 'Cat_Dogs',
    content: 'A greyhound could beat a cheetah in a long distance race.',
  ),

  // Countries
  Fact(
    id: '9',
    category: 'Counteries',
    content: 'Russia has a surface area larger than Pluto.',
  ),
  Fact(
    id: '43',
    category: 'Counteries',
    content: 'Canada has more lakes than the rest of the world combined.',
  ),
  Fact(
    id: '44',
    category: 'Counteries',
    content: 'Nauru is the only country in the world with no official capital.',
  ),
  Fact(
    id: '45',
    category: 'Counteries',
    content:
        'France covers the most time zones (12) of any country in the world.',
  ),

  // Continents
  Fact(
    id: '10',
    category: 'Continents',
    content: 'Asia covers about a third of the Earth\'s land area.',
  ),
  Fact(
    id: '46',
    category: 'Continents',
    content: 'Antarctica is the only continent without reptiles or snakes.',
  ),
  Fact(
    id: '47',
    category: 'Continents',
    content: 'Africa spans all four hemispheres of the Earth.',
  ),
  Fact(
    id: '48',
    category: 'Continents',
    content: 'South America is home to the world\'s largest river, the Amazon.',
  ),

  // Dating & Marriage
  Fact(
    id: '11',
    category: 'Dating_Merriage',
    content: 'It takes an average of 4 minutes to decide if you like someone.',
  ),
  Fact(
    id: '49',
    category: 'Dating_Merriage',
    content:
        'Couples whose personalities are too similar are less likely to last.',
  ),
  Fact(
    id: '50',
    category: 'Dating_Merriage',
    content: 'The longest recorded marriage lasted 86 years.',
  ),
  Fact(
    id: '51',
    category: 'Dating_Merriage',
    content:
        'Looking into each other’s eyes can sync your heart rates within three minutes.',
  ),

  // Earth
  Fact(
    id: '12',
    category: 'Earth',
    content:
        'A day on Earth is not actually 24 hours. It is 23 hours, 56 minutes, and 4 seconds.',
  ),
  Fact(
    id: '18',
    category: 'Earth',
    content:
        'There is enough gold in the Earth\'s core to coat its entire surface.',
  ),
  Fact(
    id: '52',
    category: 'Earth',
    content: 'Earth is the only planet not named after a god.',
  ),
  Fact(
    id: '53',
    category: 'Earth',
    content:
        'Oceans cover 71% of the Earth\'s surface, but we have only explored 5% of them.',
  ),

  // Food
  Fact(
    id: '13',
    category: 'Food',
    content:
        'Honey never spoils. Archaeologists have found pots of honey in ancient Egyptian tombs that are over 3,000 years old.',
  ),
  Fact(
    id: '17',
    category: 'Food',
    content: 'Bananas are berries, but strawberries aren\'t.',
  ),
  Fact(
    id: '54',
    category: 'Food',
    content: 'Peanuts are not actually nuts, they are legumes.',
  ),
  Fact(
    id: '55',
    category: 'Food',
    content: 'Apples float in water because they are 25% air.',
  ),

  // Health
  Fact(
    id: '14',
    category: 'Health',
    content:
        'Laughing is good for the heart and can increase blood flow by 20%.',
  ),
  Fact(
    id: '56',
    category: 'Health',
    content:
        'An apple a day really does help keep the doctor away by reducing cholesterol.',
  ),
  Fact(
    id: '57',
    category: 'Health',
    content: 'Drinking water can temporarily boost your metabolism by 24-30%.',
  ),
  Fact(
    id: '58',
    category: 'Health',
    content: 'Sleep deprivation can directly slow down your healing process.',
  ),

  // Google Topics
  Fact(
    id: '15',
    category: 'Google_topics',
    content:
        'The name "Google" was an accident. The creators wanted to name it "Googol".',
  ),
  Fact(
    id: '59',
    category: 'Google_topics',
    content: 'Google\'s first ever storage was made of Legos.',
  ),
  Fact(
    id: '60',
    category: 'Google_topics',
    content:
        'A single Google search requires more computing power than it took to send Apollo 11 to the Moon.',
  ),
  Fact(
    id: '61',
    category: 'Google topics',
    content: 'Google rents goats to help mow the lawns at their headquarters.',
  ),
];

const List<String> categoriesList = [
  'Animal',
  'Apple',
  'Art',
  'Austrailia',
  'Babies',
  'brain',
  'cars',
  'Cat_Dogs',
  'Counteries',
  'Continents',
  'Dating_Merriage',
  'Earth',
  'Food',
  'Health',
  'Google_topics',
];
