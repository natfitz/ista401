
import java.util.*;
PFont font = createFont("Arial", 48);
PFont font2 = createFont("times", 16);
int x,y;
List<Word> words;


void setup() {
  size(600,600); 
  x = 5;
  y = 15; 
  smooth();
  
  Map<String, List<String>> wordMap = loadInWords("words.txt"); 
  
  for (String k : wordMap.keySet()) {
   // println("key = " + k); 
  
    List<String> values = wordMap.get(k);
  
    for (String v : values) {
     // println("\tvalue = " + v);
    }   
  }
  
  
  words = parseGrammar(wordMap, "grammer.txt");
}


/*** 
  Loads in a text file indicating words assoicated with parts of speech, parses it, 
  and returns a Map of each part of speech and its assoicated List of words.
  Assumes each line looks like:

    POS:word1,word2,...,wordN
***/  
Map<String, List<String>> loadInWords(String filename) {
  
  Map<String, List<String>> m = new HashMap<String, List<String>>();
  
  String[] lines = loadStrings(filename);
  
  for (int i = 0 ; i < lines.length; i++) {
    //println(lines[i]);
    String[] chop = split(lines[i], ':');
    
    String POS = chop[0];
    String wordsStr = chop[1];
    //println("\tLEFT SIDE = " + POS);
    //println("\tRIGHT SIDE = " + wordsStr + "\n");
    
    String[] wordsArr = split(wordsStr, ','); //split right side into an array of Strings
    List<String> wordsList = Arrays.asList(wordsArr); //turns array into a List
    
    
   
    for (String tmpStr : wordsList) {
      //println("\t\tword="+tmpStr);
    }
    
    
    m.put(POS, wordsList);
  }
  
  return m;
}


/***
  Reads through a text file of parts of speech and looks through a Map m for a random word 
  that corresponds to each part of speech. Returns a populated List of Word objects, where
  each type of Word has its own render() method.
***/

List<Word> parseGrammar( Map<String, List<String>> m, String filename) {
  
  List<Word> ws = new ArrayList<Word>();
  // TO DO - 
  // 1. Load in Strings from "grammar.txt" and loop through each line.
  String[] lines = loadStrings(filename);
  
  
  for(String line : lines) {
    println(line); 
    
    String[] posArr = line.split(" ");
    List<String> posList = Arrays.asList(posArr); //turns array into a List
    
    for (String p : posList) {
      //println("\t" + p);
      
      List<String> listOfWords = m.get(p);
      
      int randNum = (int) random(0,listOfWords.size());
       
      String randomWord = listOfWords.get( randNum );
      println("\t\t" + randomWord);
      Word w;
      if (p.equals("Noun")){
         w = new WordNoun(new PVector(x,y), color(134,55,240), randomWord, p);
         int sw = (int)textWidth(w.word);
        x+=sw+15;
 

       if(x+sw>width){
         x = 5;
         y +=30;
       } 
      }else
      
        if (p.equals("Verb")){
          w = new WordVerb(new PVector(x,y), color(220,100,22), randomWord, p);
          int sw = (int)textWidth(w.word);
        x+=sw+15;
 

       if(x+sw>width){
         x = 5;
         y +=30;
       } 
         }else
      
        if (p.equals("Adjective")){
          w = new WordAdj(new PVector(x,y), color(255,255,0), randomWord, p);
          int sw = (int)textWidth(w.word);
        x+=sw+10;
 

       if(x+sw>width){
         x = 5;
         y +=30;
       } 
         }else
      
        if (p.equals("Conjunction")){
          w = new WordConj(new PVector(x,y), color(100,25,100), randomWord, p);
          int sw = (int)textWidth(w.word);
        x+=sw+15;
 

       if(x+sw>width){
         x = 5;
         y +=30;
       } 
         }else
      
        if (p.equals("Adverb")){
          w = new WordVerb(new PVector(x,y), color(50,155,50), randomWord, p);
          int sw = (int)textWidth(w.word);
        x+=sw+15;
 

       if(x+sw>width){
         x = 5;
         y +=30;
       } 
        }else{  
        
       w = new Word(new PVector(x,y), color(0,255,0), randomWord, p);
        int sw = (int)textWidth(w.word);
        x+=sw+10;
 

       if(x+sw>width){
         x = 5;
         y +=30;
       } 
        
      }
      ws.add(w);
   
  }
  }
  
  // 2. For each POS in the line, get the associated List of words from Map m.
  // 3. Choose a random word from the list.
  // 4. Place this word in a List that we will read from in the draw() loop. 
  
  return ws;
 }



void draw() {
   background(0,0,0,255); 
   for (Word w : words) {
     w.bounce();
     w.move();
     w.render();
     w.age();
  /*   int sw = (int)textWidth(w.word);
     x+=sw+10;
 

     if(x+sw>width){
       x = 5;
       y +=20;
     }
    */
   }
}
  
