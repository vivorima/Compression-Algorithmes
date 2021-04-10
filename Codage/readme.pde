//Un pixel a deux valeurs possibles (0 pour le noir et 255 pour le blanc) et donc codé sur un octet : 00H ou FFH.

//NOIR 00h
//BLANC FFH

//Une image de n pixels sera donc représentée par une chaîne de n caractères. 

//Il s’agit de compresser et de décompresser une telle image. Pour cela, le codage suivant est utilisé :


//– Si le même pixel se répète 3 fois ou plus, on utilisera un mot de deux octets :
//le bit de poids fort est à 1, et les 15 autres bits servent à coder le nombre de répétitions du pixel. 
//Ces deux octets sont ensuite suivis de la couleur répétée.


//– Si on a une suite de pixels différents (ou qui ne se répètent pas plus de 2 fois), 
//on fera précéder cette suite d’un mot de deux octets où le bit de poids fort est à 0,
//et les 15 autres bits servent à coder la taille de la suite.



/*


1- Ecrire le programme correspondant en Processing qui permet de lire une image et produit un fichier de codes en hexadécimal représentant l’image compressée. 
Appliquer le programme pour les deux cas d’images de fax fournies (noir et blanc). 
Calculer les taux de compression pour chacune des images.
2- Ecrire le programme correspondant en Processing qui permet de lire un fichier compressé et de retrouver l’image d’origine et de la visualiser.


*/
















/*
int[]Code;


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
           cp=cp+1; 
           clr=clr.concat(""+Code.get(k).toString().substring(6));
           Code.remove(Code.get(k)); //je remove k donc k+1 prends la place de k, non?
           g=Integer.parseInt((String)Code.get(k).subSequence(1, Code.get(k).length()-4) ,16)-32768; //deleting les 8000 because of hexa
         }  
         
         //ajout des 0 pour faire un mot :3
         int v= 4- Integer.toHexString(cp).length();
         
         String c="";
         int b=0;
         while(b<v) {c=c.concat("0");b++;}
         c=c.concat(Integer.toHexString(cp));
         Code.set(k, "("+c+")".concat(clr) );//j'ajoute f k puisque jai supp tous les autres
         k++;
        }
        
     }




*/
