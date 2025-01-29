import 'package:flutter/material.dart';
import 'package:quotes_app/model/grid_item.dart';

class HomeViewModel extends ChangeNotifier {
  // Define the grid items for all moods
  final List<GridItem> gridItems = [
    GridItem(title: "Alone", icon: Icons.sentiment_dissatisfied, color: Colors.blue),
    GridItem(title: "Angry", icon: Icons.sentiment_very_dissatisfied, color: Colors.red),
    GridItem(title: "Anniversary", icon: Icons.cake, color: Colors.orange),
    GridItem(title: "Attitude", icon: Icons.military_tech, color: Colors.brown),
    GridItem(title: "Awesome", icon: Icons.thumb_up, color: Colors.purple),
    GridItem(title: "Beautiful", icon: Icons.favorite, color: Colors.pinkAccent),
    GridItem(title: "Best", icon: Icons.star, color: Colors.green),
    GridItem(title: "Calm", icon: Icons.self_improvement, color: Colors.lightBlue),
    GridItem(title: "Confident", icon: Icons.verified, color: Colors.deepOrange),
    GridItem(title: "Depressed", icon: Icons.mood_bad, color: Colors.grey),
    GridItem(title: "Grateful", icon: Icons.sentiment_satisfied, color: Colors.teal),
    GridItem(title: "Happy", icon: Icons.emoji_emotions, color: Colors.yellow),
    GridItem(title: "Hopeful", icon: Icons.lightbulb, color: Colors.lightGreen),
    GridItem(title: "Inspirational", icon: Icons.auto_stories, color: Colors.indigo),
    GridItem(title: "Lonely", icon: Icons.nights_stay, color: Colors.blueGrey),
    GridItem(title: "Motivational", icon: Icons.fitness_center, color: Colors.amber),
    GridItem(title: "Nostalgic", icon: Icons.album, color: Colors.purpleAccent),
    GridItem(title: "Peaceful", icon: Icons.spa, color: Colors.greenAccent),
    GridItem(title: "Sad", icon: Icons.sentiment_very_dissatisfied, color: Colors.cyan),
    GridItem(title: "Stress", icon: Icons.health_and_safety, color: Colors.pink),
    GridItem(title: "Success", icon: Icons.emoji_events, color: Colors.blueAccent),
    GridItem(title: "Surprised", icon: Icons.emoji_emotions, color: Colors.deepPurple),
  ];

  // Define quotes for each category (shortened for brevity)
 final Map<String, List<String>> quotes = {
  "Alone": [
    "You are never alone.",
    "In solitude, you find your true self.",
    "Sometimes, being alone is the best way to reconnect with yourself.",
    "Being alone allows you to rediscover your inner peace.",
    "Alone is not lonely, it's a gift of freedom.",
    "Loneliness is not an absence of love, but the presence of self.",
    "Solitude is where I place my chaos to rest and awaken my inner peace.",
    "You are your best companion when you’re alone."
  ],
  "Angry": [
    "Control your anger.",
    "Anger is one letter short of danger.",
    "Let go of anger to be free.",
    "Anger is a short madness.",
    "The best fighter is never angry.",
    "Let go of anger to find peace.",
    "Anger makes you smaller, while forgiveness forces you to grow beyond what you were.",
    "When you are angry, remember that you are the one who suffers most.",
    "Anger is an expensive emotion. It costs you peace of mind and happiness.",
    "Learn to be angry with yourself and you’ll never need to be angry with others."
  ],
  "Anniversary": [
    "Happy Anniversary!",
    "Cheers to many more years.",
    "Love grows with time.",
    "An anniversary is the celebration of love, trust, partnership, tolerance, and tenacity.",
    "Wishing you another year of love, happiness, and joy.",
    "Through thick and thin, you are my best friend and love. Happy Anniversary!",
    "A successful marriage requires falling in love many times, always with the same person.",
    "The best thing to hold onto in life is each other. Happy Anniversary!",
    "Here’s to another year of cherished moments.",
    "An anniversary is a reminder of the wonderful journey you’ve shared together."
  ],
  "Attitude": [
    "Attitude is everything.",
    "Your attitude determines your direction.",
    "Stay confident, stay positive.",
    "A bad attitude is like a flat tire. You can’t go anywhere until you change it.",
    "A positive attitude changes everything.",
    "The only difference between a good day and a bad day is your attitude.",
    "Your vibe attracts your tribe.",
    "An attitude of gratitude makes every day a blessing.",
    "Success is the sum of small efforts repeated day in and day out.",
    "The right attitude will make any situation work."
  ],
  "Awesome": [
    "You are awesome just the way you are.",
    "Every day may not be good, but there is something good in every day.",
    "Be yourself; everyone else is already taken.",
    "Do what you love, love what you do.",
    "The world is full of magic things, patiently waiting for our senses to become sharper.",
    "If you can dream it, you can do it.",
    "The only way to do great work is to love what you do.",
    "Life is either a daring adventure or nothing at all.",
    "You are capable of amazing things.",
    "Live your life to the fullest, for you are awesome!"
  ],
  "Beautiful": [
    "Beauty begins the moment you decide to be yourself.",
    "True beauty comes from within.",
    "You are beautiful inside and out.",
    "Elegance is the only beauty that never fades.",
    "Beauty is not in the face; beauty is a light in the heart.",
    "In a world full of trends, remain a classic.",
    "A beautiful soul shines through a beautiful smile.",
    "The most beautiful things in life are unseen; they are felt with the heart.",
    "Beauty is power; a smile is its sword.",
    "Beauty is not about having a pretty face, it’s about having a pretty mind, a pretty heart, and a pretty soul."
  ],
  "Best": [
    "The best is yet to come.",
    "You don’t have to be the best, just be your best.",
    "Always do your best. What you plant now, you will harvest later.",
    "The best way to predict the future is to create it.",
    "Do what is right, not what is easy.",
    "Strive for progress, not perfection.",
    "The best way out is always through.",
    "Be the best version of yourself.",
    "Be the best you can be; that’s all anyone can ask.",
    "The best time to plant a tree was 20 years ago. The second-best time is now."
  ],
  "Calm": [
    "Stay calm; peace is power.",
    "Inner calm leads to outer strength.",
    "Calmness is the cradle of power.",
    "In the midst of chaos, find your calm.",
    "Peace is not the absence of chaos, but the presence of calm in the midst of it.",
    "The calmer you are, the more you can think clearly.",
    "Calmness is the key to happiness.",
    "Take a deep breath and let it all go.",
    "Inhale peace, exhale chaos.",
    "Stillness is the key to unlocking your inner peace."
  ],
  "Confident": [
    "Believe in yourself.",
    "Confidence is contagious.",
    "With confidence, you have won before you have started.",
    "Confidence is not they will like me, confidence is I’ll be fine if they don’t.",
    "You are more powerful than you think.",
    "Self-confidence is the best outfit. Rock it and own it.",
    "Your value doesn’t decrease based on someone’s inability to see your worth.",
    "Confidence is the ability to feel beautiful, without needing someone to tell you.",
    "Confidence comes not from always being right, but from not fearing to be wrong.",
    "Confidence is silent. Insecurities are loud."
  ],
  "Depressed": [
    "This too shall pass.",
    "Every storm runs out of rain.",
    "You are stronger than you think.",
    "In the middle of difficulty lies opportunity.",
    "Don’t let the darkness overwhelm you.",
    "Even the darkest night will end and the sun will rise.",
    "When you feel like quitting, remember why you started.",
    "It’s okay to not be okay.",
    "One day at a time is all you need.",
    "Depression is not a sign of weakness, it’s a sign of being strong for too long."
  ],
  "Grateful": [
    "Gratitude turns what we have into enough.",
    "Be thankful for today.",
    "Gratitude is not only the greatest of virtues, but the parent of all the others.",
    "Gratitude is the fairest blossom which springs from the soul.",
    "Gratitude makes sense of our past, brings peace for today, and creates a vision for tomorrow.",
    "Gratitude is the healthiest of all human emotions.",
    "Gratitude unlocks the fullness of life.",
    "Gratitude turns ordinary into extraordinary.",
    "Gratitude is the key to a joyful life.",
    "When we give cheerfully and accept gratefully, everyone is blessed."
  ],
  "Happy": [
    "Happiness is a choice.",
    "Do more of what makes you happy.",
    "Happiness depends upon ourselves.",
    "The purpose of life is not to be happy, but to be useful, to be honorable, to be compassionate, to have it make some difference that you have lived and lived well.",
    "Happiness is not by chance, but by choice.",
    "The happiest people don’t have the best of everything, they make the best of everything.",
    "Happiness is when what you think, what you say, and what you do are in harmony.",
    "Happiness is not something ready-made. It comes from your own actions.",
    "Happiness is the highest good.",
    "If you want to be happy, be."
  ],
  "Hopeful": [
    "Hope is the heartbeat of the soul.",
    "Stay positive; better days are ahead.",
    "Hope is the thing with feathers that perches in the soul.",
    "Where there is hope, there is life.",
    "Keep your face always toward the sunshine—and shadows will fall behind you.",
    "Hope is not a strategy, but it is a foundation for overcoming challenges.",
    "Hope sees the invisible, feels the intangible, and achieves the impossible.",
    "Hope is the only thing stronger than fear.",
    "When you’re hopeful, nothing is impossible.",
    "Hope is a waking dream."
  ],
  "Inspirational": [
    "Dream big, work hard.",
    "Believe you can and you're halfway there.",
    "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "The only way to do great work is to love what you do.",
    "Don't watch the clock; do what it does. Keep going.",
    "The best way to predict the future is to create it.",
    "Success is not the key to happiness. Happiness is the key to success.",
    "Great things never come from comfort zones.",
    "Hardships often prepare ordinary people for an extraordinary destiny.",
    "It always seems impossible until it’s done."
  ],
  "Lonely": [
    "Loneliness adds beauty to life.",
    "Sometimes, being alone is freeing.",
    "The eternal quest of the human being is to shatter his loneliness.",
    "Loneliness is the human condition. No one is ever going to fill that space.",
    "It’s okay to be lonely. Being alone doesn’t mean you're abandoned.",
    "The greatest thing in the world is to know how to belong to oneself.",
    "Loneliness is not an absence of love, but an absence of connection.",
    "Sometimes, we need to be alone to reconnect with ourselves.",
    "Solitude is the greatest companion of the artist.",
    "In solitude, we find clarity."
  ],
  "Motivational": [
    "Push harder than yesterday.",
    "Your only limit is you.",
    "The harder you work for something, the greater you’ll feel when you achieve it.",
    "The future belongs to those who believe in the beauty of their dreams.",
    "Motivation is what gets you started. Habit is what keeps you going.",
    "Don’t wait for opportunity. Create it.",
    "Believe you can and you're halfway there.",
    "Start where you are. Use what you have. Do what you can.",
    "If you can dream it, you can do it.",
    "The way to get started is to quit talking and begin doing."
  ],
  "Nostalgic": [
    "Memories are timeless treasures of the heart.",
    "The past is never lost; it’s always within.",
    "Sometimes you just have to look back and smile at how far you've come.",
    "The nostalgia of moments past can warm our hearts forever.",
    "Nostalgia is a dirty liar that insists things were better than they seemed.",
    "The present is the past’s gift.",
    "Sometimes, remembering is all we can do.",
    "Nostalgia: a bittersweet reminder of the moments that shaped us.",
    "We do not remember days, we remember moments.",
    "Nostalgia is a beautiful feeling but can also be an escape."
  ],
  "Peaceful": [
    "Peace begins with a smile.",
    "Do not let the behavior of others destroy your peace.",
    "Peace is the result of retraining your mind to process life as it is, rather than as you think it should be.",
    "When you find peace within yourself, you become the kind of person who can live at peace with others.",
    "Inner peace is the key to outer peace.",
    "Peace is not absence of conflict, it is the ability to handle conflict by peaceful means.",
    "The more peace you have inside of you, the more peace you bring to the world.",
    "True peace is not just the absence of conflict, it’s the presence of love.",
    "Your peace is your power.",
    "Peaceful people are peaceful to themselves."
  ],
  "Sad": [
    "Tears are words the heart can’t express.",
    "Sadness flies away on the wings of time.",
    "Sometimes, sadness is just a reminder that you are capable of love.",
    "In sadness, we often find our true strength.",
    "Tears cleanse the heart, and sadness clarifies the mind.",
    "Let your tears be a sign of your resilience, not your weakness.",
    "Every tear is a lesson learned.",
    "Sadness is not the end of the road, it’s just a detour.",
    "Cry if you must, but don’t forget to smile after.",
    "Out of sadness, we find courage and strength."
  ],
  "Stress": [
    "Take a deep breath and relax.",
    "Stress less and enjoy the best.",
    "Stress is caused by being here but wanting to be there.",
    "Don’t stress, do your best, forget the rest.",
    "The greatest weapon against stress is our ability to choose one thought over another.",
    "Stress is not what happens to us. It’s our response to what happens.",
    "Sometimes the most productive thing you can do is relax.",
    "Take a break; breathe deeply, you deserve it.",
    "Stress is an energy that demands to be released.",
    "Let go of stress, and you'll find your peace."
  ],
  "Success": [
    "Success is no accident.",
    "The key to success is to focus on goals, not obstacles.",
    "Success usually comes to those who are too busy to be looking for it.",
    "Success is not in what you have, but who you have become.",
    "Success is walking from failure to failure with no loss of enthusiasm.",
    "Success is not the key to happiness. Happiness is the key to success.",
    "The road to success is always under construction.",
    "Don't be afraid to give up the good to go for the great.",
    "The secret to success is consistency of purpose.",
    "Success is achieved by developing our strengths, not by eliminating our weaknesses."
  ],
  "Surprised": [
    "Surprises are the joy of life.",
    "Expect the unexpected.",
    "Surprise is the greatest gift which life can grant us.",
    "Life is full of surprises; keep an open mind.",
    "Surprise is the spice of life.",
    "The unexpected is always what keeps life interesting.",
    "Sometimes, surprises are the best moments of our lives.",
    "Surprise yourself; take a step outside of your comfort zone.",
    "When life surprises you, it’s a sign of something better ahead.",
    "The biggest surprises come when you least expect them."
  ],
};

  // Get quotes for a specific category
  List<String> getQuotes(String category) {
    return quotes[category] ?? ["No quotes available for this category."];
  }
}
