class Question {
  //properties
  late String questionText;
  late bool questionAnswer;

 Question( String q, bool  a)
  {
    //constructor
    //initialize properties
    questionText = q;
    questionAnswer = a;
  }
}
  Question newQuestion  = Question('text', true);