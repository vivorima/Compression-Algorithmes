
import java.util.Arrays;
import java.util.List;
  int l=0;
  PImage out;
void setup() {
  size(128, 128);
   out=createImage(128,128,RGB);
  out.loadPixels();
  parseFile();
 
}

void draw(){
   
        image(out,0,0);    
  
}




String[] splitToNChar(String text, int size) {
        ArrayList<String> parts = new ArrayList<String>();

        int length = text.length();
        for (int i = 0; i < length; i += size) {
            parts.add(text.substring(i, Math.min(length, i + size)));
        }
        return parts.toArray(new String[0]);
    }


int getcouleur(String g)
{
  if(g.equals("00H")) return 0;
 
  if(g.equals("FFH")) return 255; 
  return -1;
}

void parseFile() {
  // Open the file from the createWriter() example
  BufferedReader reader = createReader("compression.txt");
  String line = null;
  try {
    while ((line = reader.readLine()) != null) {
      
      String[] pieces = split(line, " ");
      
    int k;
      //le dernier is a blank
     for (int i=0; i<pieces.length-1;i++)
      {
        

        String c=pieces[i].substring(6,pieces[i].length()); //get la chaine complete de cla couleur fh00h.....
        String[] clr= splitToNChar( c , 3) ; //mettre chaque couleur dans une case :3
        int num;
        
         //si kayen une case
         if(clr.length==1)  num=Integer.parseInt(pieces[i].substring(1,5),16)-32768; //num en hexa je supp les 8000 
                       else num=Integer.parseInt(pieces[i].substring(1,5),16);  // sinon je prends le nim en hexa tel quel  donc num = nbre de pixel :333  numm ici est cence etre nbre clr+1
             
         k=0;// k is un compteur des pixels de my file 
        //L is le pixel de limage que jessaye de créer 
        
        while (k<num )
        {
          
          if(clr.length==1) {out.pixels[l]= color(getcouleur(clr[0]));l++;}
          else {out.pixels[l] = color(getcouleur(clr[k]));l++;}
          k++;
        }
          clr=null;
          out.updatePixels();
      }
         
    }
    
    print(l);
    out.save("hum.bmp");
    reader.close();
  } catch (IOException e) {
    e.printStackTrace();
  }
} 
