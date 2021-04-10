import java.util.*;
void setup() {
 
  /*size(600, 400);
  background(51);
  NodeLR racine=  ConstruireArbre(GetAllAlphabet(parseFile()));
  racine.x=width / 2;
    racine.y=16;
  racine.visit(racine);
*/

AffecterCode(ConstruireArbre(GetAllAlphabet(parseFile())));

}

//Probleme ne parcoure pas tt le tableau =Solved 
//contains ne me rends pas true = Solved

String parseFile() {
  //lire mon fichier
  BufferedReader reader = createReader("Text.txt");
  
  //string va conternir mon texte 
  String line = "";
  String bye="";
     try
     {//read line avance a chaque appel
      while((line =reader.readLine())!=null){
        //i use bye pour ne pas arriver a null
        bye=bye.concat(line);
      }
     }  
  catch (IOException e) {
    e.printStackTrace();
  }
  println(bye);
 return bye;
  
}




//ME RETOURNE TABLEAU TRIè
//enter est un null wa9il 
ArrayList<NodeLR> GetAllAlphabet(String line)
{
  if (line!= null)
  {
      String []cars=line.split("");
          //ArrayList<String> chars = new ArrayList<String>();
          ArrayList<NodeLR> occs = new ArrayList<NodeLR>();
          for(int i=0; i<cars.length; i++)
          {
            //add fla condition cars[i]!="\n" &&
              if (  occs.indexOf(new NodeLR(cars[i].charAt(0)))<0   ) 
              {
                occs.add(CountOcc(cars[i],cars)); 
                //chars.add(cars[i]); 
              } 
              
          }
     
            Collections.sort(occs);
             /* for (NodeLR n:occs)
              {
                println(n.ToString());
              }*/
          return occs;  

}
  else print("\nLine Null");
  
  return null;
}




//ne compte pas a apres truc de shit  enter
NodeLR CountOcc(String s, String [] tab)

{
  
  int count=0;
  for(int i=0; i<tab.length; i++)
  {
    if (tab[i].equals(s)) count++;
  }

NodeLR n=new NodeLR ( s.charAt(0) ,count);

return n;
}






void AffecterCode(NodeLR root)
{
     if(root.c!='*') println(root.c+root.code);
    if (root.Left != null) {root.Left.code=root.code+"0"; AffecterCode(root.Left); }
    if (root.Right != null) {root.Right.code=root.code+"1"; AffecterCode(root.Right);}
}
 





//FIX LORDREEE
NodeLR ConstruireArbre(ArrayList<NodeLR> occs){
  
  ArrayList<NodeLR> use=occs;
  //ArrayList<NodeLR> arbre=new ArrayList<NodeLR>();
  NodeLR f=null;
    for (NodeLR n:use)
              {
                println(n.ToString());
              }
  
  Collections.sort(use);
  while (use.size()>1)
  {   
    
      f=new NodeLR('*'  ,use.get(0).occ+use.get(1).occ  ,use.get(0)  ,use.get(1));
      use.remove(0);
      use.remove(0);
      use.add(f);
      Collections.sort(use);
      /*for (NodeLR n:use)
              {
                println("\n"+n.c + n.occ);
              }
     */
  }
  
print("\n Arbre:");

//println(use.get(0).ToString());

use.get(0).code="0";
return use.get(0);
}
