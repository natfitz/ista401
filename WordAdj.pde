public class WordAdj extends Word{

public WordAdj(PVector _xy, color _c, String _w, String _pos){
    super(_xy, _c, _w, _pos);
    vel = new PVector(0, 0.2);
  }

   void render(){
    textFont(font2, 10);
    fill(c); // text color
    text(word, start.x, start.y); // print character represented by the Char object at it's current position value.
  }
 
 

}

