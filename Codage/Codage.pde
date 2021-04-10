PImage img;
int w, h;
float r,g,b;
  
PrintWriter output;
//NOIR   00h  0
//BLANC FFH 255

void setup() {
  size(128, 128);
  img = loadImage("im.bmp");
  output = createWriter("compression.txt");
  w=img.width;
  h=img.height;
  
  img.loadPixels();
   read();
}


void draw() {
  image(img, 0, 0);
  
}

void read(){ 

  ArrayList<String> Code=new ArrayList<String>(); 
  int cpt=1; 
  for (int i = 0; i < w*h-1; i++ ){ 
    
    if(brightness(img.pixels[i])==brightness(img.pixels[i+1])) cpt++;
    else 
    {
      
      String word= Integer.toHexString(32768 +cpt);
           
           if((int)brightness(img.pixels[i])==0) Code.add("("+word+")".concat("00H")); 
           else     if((int)brightness(img.pixels[i])==255) Code.add("("+word+")".concat("FFH"));//blanc
         
      
      
      cpt=1;
      
      }
    }
      
     printArray(Code);
      
    // probleme quand il trouve un chiffre b hexa quon ne ooeut ecrire f int :3 
      
      
int cp,g;
   
      
         for(int k=0;k<Code.size();k++)
       {
         cp=0; g=0;
         String clr="";
         
         g=Integer.parseInt((String)Code.get(k).subSequence(1, Code.get(k).length()-4) ,16)-32768; //nombre de pixels
        if(g<=2 ){
         while( g < 3 ) 
         {
           //println("\nG="+g);
           cp=cp+g; 
           for(int m=0;m<g;m++){
           clr=clr.concat(""+Code.get(k).toString().substring(6));} //akoute les couleurs autant de fois que les pixels :( me sad
           Code.remove(Code.get(k)); //je remove k donc k+1 prends la place de k, non?
           g=Integer.parseInt((String)Code.get(k).subSequence(1, Code.get(k).length()-4) ,16)-32768; //deleting les 8000 because of hexa
         }  
         
         //ajout des 0 pour faire un mot :3
         int v= 4- Integer.toHexString(cp).length();
         
         String c="";
         int b=0;
         while(b<v) {c=c.concat("0");b++;}
         c=c.concat(Integer.toHexString(cp));
         //set ecrase par contre add pousse everything
         Code.add(k, "("+c+")".concat(clr) );//j'ajoute f k puisque jai supp tous les autres
         
        }
        
     }

      printArray(Code);
      
      
      //fichier
      for(String s:Code)
      {
        output.print(s+" ");
      }
      
    output.close(); // Finishes the file  
      
}  
    
