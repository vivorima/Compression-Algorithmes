import java.util.*;
void setup() {
  
  ConstruireArbre(GetAllAlphabet(parseFile()));
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
ArrayList<Node> GetAllAlphabet(String line)
{
  if (line!= null)
  {
      String []cars=line.split("");
          //ArrayList<String> chars = new ArrayList<String>();
          ArrayList<Node> occs = new ArrayList<Node>();
          for(int i=0; i<cars.length; i++)
          {
            //add fla condition cars[i]!="\n" &&
              if (  occs.indexOf(new Node(cars[i].charAt(0)))<0   ) 
              {
                occs.add(CountOcc(cars[i],cars)); 
                //chars.add(cars[i]); 
              } 
              
          }
     
            Collections.sort(occs);
             /* for (Node n:occs)
              {
                println(n.ToString());
              }*/
          return occs;  

}
  else print("\nLine Null");
  
  return null;
}




//ne compte pas a apres truc de shit  enter
Node CountOcc(String s, String [] tab)

{
  
  int count=0;
  for(int i=0; i<tab.length; i++)
  {
    if (tab[i].equals(s)) count++;
  }

Node n=new Node ( s.charAt(0) ,count);

return n;
}













void ConstruireArbre(ArrayList<Node> occs){
  
  //ArrayList<Node> use=occs;
  //ArrayList<Node> arbre=new ArrayList<Node>();
  Node f=null;
  
  
  int i=0;
  while (i<occs.size()-1 )
  {
    f=new Node('*', occs.get(i).occ+occs.get(i+1).occ);
    occs.get(i).SetFather(f);
    occs.get(i+1).SetFather(f);
    i++;
  }
  
print("\n ARBRE:");
  for (Node n:occs)
              {
                println(n.ToString());
              }
}
