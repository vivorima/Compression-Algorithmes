


class NodeLR implements Comparable<NodeLR>{

  char c;
  int occ;
  NodeLR Left,Right;
  String code;
 // float x,y;
  NodeLR(char c)
  {
     this.c=c;
  }

    NodeLR(char c, int o)
  {
     this.c=c;
     this.occ=o;
     
  }  
  
   NodeLR(char c, int o, NodeLR L,NodeLR R)
  {
   // this.x=0;this.y=0;
    this.c=c;
     this.occ=o;
     Left=L;
     //Left.x = this.x - 50;
     //Left.y = this.y + 20;
     Right=R;
     //Right.x = this.x + 50;
     //Right.y = this.y + 20;
  } 
  
  
  
  void SetLeft(NodeLR n)
  {
    Left=n;
  }
 
 void SetRight(NodeLR n)
  {
    Right=n;
  }
  
  
  
  //LE TRIIIIIIIIIIIIIIIIIIII
  //1  si sup 
  //0 si inf ou ==
  @Override
  public int compareTo(NodeLR o)
  {
    
      if (this.occ==o.occ) { 
      Character t= new Character(c);
      Character ob= new Character(o.c);
      return t.compareTo(ob); }
      
      else     return (this.occ-o.occ);
  }
  
  
  //pour le contains mais pas pour le triiiiiiiiiiiii
    @Override
  public boolean equals(Object o)
  {
    
    if (o != null && o instanceof NodeLR)
    {
           NodeLR n = (NodeLR) o;
           if (String.valueOf(this.c).equals(String.valueOf(n.c)) ) return true;
    }
    
     return false; 
  }




public String ToString()
{
  if(Left !=null && Right!=null){
     return "char="+c + " ,occ=" + occ + " \nLeft=" + Left.ToString()+ "\n0Right=" + Right.ToString();
  }
  return " char="+c + " ,occ=" + occ;
}







/*

  void visit(NodeLR parent) {
    if (Left != null) {
      Left.visit(this);
    }
    println(c);
    fill(255);
    noStroke();
    textAlign(CENTER);
    text(c, x, y);
    stroke(255);
    noFill();
    ellipse(x, y, 20, 20);
    line(parent.x, parent.y, x, y);
    if (Right != null) {
      Right.visit(this);
    }
  }
*/


}
