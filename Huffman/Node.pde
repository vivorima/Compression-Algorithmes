


class Node implements Comparable<Node>{

  char c;
  int occ;
  Node Father;

  Node(char c)
  {
     this.c=c;
  }

    Node(char c, int o)
  {
     this.c=c;
     this.occ=o;
     
  }  
  
   Node(char c, int o, Node F)
  {
     this.c=c;
     this.occ=o;
     Father=F;
  } 
  
  
  
  void SetFather(Node n)
  {
    Father=n;
  }
 
  
  
  
  //LE TRIIIIIIIIIIIIIIIIIIII
  //1  si sup 
  //0 si inf ou ==
  @Override
  public int compareTo(Node o)
  {
      
     return (this.occ-o.occ);
  }
  
  
  //pour le contains mais pas pour le triiiiiiiiiiiii
    @Override
  public boolean equals(Object o)
  {
    
    if (o != null && o instanceof Node)
    {
           Node n = (Node) o;
           if (String.valueOf(this.c).equals(String.valueOf(n.c)) ) return true;
    }
    
     return false; 
  }




public String ToString()
{
  if(Father!=null){
 return "\n char="+c + " ,occ=" + occ + " ,\nFather=" + Father.ToString();
  }
  return "\n char="+c + " ,occ=" + occ;
}













}
