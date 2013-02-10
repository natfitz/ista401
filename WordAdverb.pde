public class WordAdverb extends Word{

public WordAdverb(PVector _xy, color _c, String _w, String _pos){
    super(_xy, _c, _w, _pos);
    vel = new PVector(0, 0.3);
  }

 void render(){
    textFont(font2, 14);
    fill(c); // text color
    text(word, start.x, start.y); // print character represented by the Char object at it's current position value.
  }
}
