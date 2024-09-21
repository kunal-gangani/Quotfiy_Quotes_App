import 'package:quotes_app/modal_class/quotes_class_model.dart';

List<Map<String, dynamic>> quotesData = [
  {
    "quote": "Priortize yourself first. Nobody matters more than you.",
    "author": "Kaira",
    "category": "Motivation"
  },
  {
    "quote": "In the quiet moments, we find the answers we seek.",
    "author": "Raj",
    "category": "Reflection"
  },
  {
    "quote": "A small step every day builds a lifetime of progress.",
    "author": "Anya",
    "category": "Happiness"
  },
  {
    "quote":
        "Courage is built in the moments when you're uncertain but keep going anyway.",
    "author": "Puhumi",
    "category": "Courage"
  },
  {
    "quote":
        "True strength lies in the ability to remain calm when chaos surrounds you.",
    "author": "Rohit",
    "category": "Strength"
  },
  {
    "quote":
        "The world may rush, but the most valuable things take time to grow.",
    "author": "Chaand",
    "category": "Patience"
  },
  {
    "quote": "The best stories are lived, not written.",
    "author": "Mann",
    "category": "Life"
  },
  {
    "quote": "The real adventure starts when you stop following the map.",
    "author": "Sujal",
    "category": "Adventure"
  },
  {
    "quote": "Even the smallest light can brighten the darkest of nights.",
    "author": "Vraj",
    "category": "Hope"
  },
  {
    "quote": "Change begins the moment you decide you're ready.",
    "author": "Aryan",
    "category": "Change"
  },
  {
    "quote": "A peaceful mind creates a peaceful life.",
    "author": "Jainam",
    "category": "Mindfulness"
  },
  {
    "quote":
        "Success isn't measured by the destination but by the progress along the way.",
    "author": "Chachu",
    "category": "Success"
  },
  {
    "quote":
        "Opportunities don't wait, they arrive when you're ready for them.",
    "author": "Suresh",
    "category": "Opportunity"
  },
  {
    "quote": "Every sunset brings the promise of a new dawn.",
    "author": "Ankit",
    "category": "Hope"
  },
  {"quote": "I'm Batman.", "author": "Kunal", "category": "Motivation"},
  {
    "quote": "When in doubt, take the next small step.",
    "author": "Amisha",
    "category": "Motivation"
  },
  {
    "quote": "The journey of a thousand miles begins with one step.",
    "author": "Lao Tzu",
    "category": "Journey"
  },
  {
    "quote":
        "The only limit to our realization of tomorrow is our doubts of today.",
    "author": "Franklin D. Roosevelt",
    "category": "Inspiration"
  },
  {
    "quote": "Believe you can and you're halfway there.",
    "author": "Theodore Roosevelt",
    "category": "Confidence"
  },
  {
    "quote": "Do what you can, with what you have, where you are.",
    "author": "Theodore Roosevelt",
    "category": "Motivation"
  },
  {
    "quote":
        "It's not about how fast you get there, it's about how long you can stay on the journey.",
    "author": "Rashi",
    "category": "Perseverance"
  },
  {
    "quote":
        "Failure is simply the opportunity to begin again, this time more intelligently.",
    "author": "Henry Ford",
    "category": "Failure"
  },
  {
    "quote": "The mind is everything. What you think you become.",
    "author": "Buddha",
    "category": "Mindfulness"
  },
  {
    "quote":
        "Not everything that can be counted counts, and not everything that counts can be counted.",
    "author": "Albert Einstein",
    "category": "Philosophy"
  },
  {
    "quote":
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "author": "Winston Churchill",
    "category": "Success"
  },
  {
    "quote": "A diamond is a chunk of coal that did well under pressure.",
    "author": "Henry Kissinger",
    "category": "Courage"
  },
  {
    "quote":
        "Happiness is not something ready-made. It comes from your own actions.",
    "author": "Dalai Lama",
    "category": "Happiness"
  },
  {
    "quote": "The only way to do great work is to love what you do.",
    "author": "Steve Jobs",
    "category": "Work"
  },
  {
    "quote":
        "What lies behind us and what lies before us are tiny matters compared to what lies within us.",
    "author": "Ralph Waldo Emerson",
    "category": "Strength"
  },
  {
    "quote": "Everything you've ever wanted is on the other side of fear.",
    "author": "George Addair",
    "category": "Courage"
  },
  {
    "quote": "Life is 10% what happens to us and 90% how we react to it.",
    "author": "Charles R. Swindoll",
    "category": "Life"
  }
];

List quotes = quotesData
    .map(
      (e) => QuotesClassModel.fun(data: e),
    )
    .toList();

List allQuotes = quotes
    .map(
      (e) => e.category,
    )
    .toList()
    .toSet()
    .toList();
