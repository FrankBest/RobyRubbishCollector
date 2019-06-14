int map[][] = new int[12][12];
Robot roby = new Robot();
int moves = 0;
//int mapsave[][] = new int[12][12];


void setup(){
  size(600,600);
  strokeWeight(0);
  generateMap();
}

void draw(){
  //frameRate(10);
  if( moves < 200){
    showMap();
    roby.show();
    roby.operate();
    moves++;
  }
}

void generateMap(){
  for(int i = 0; i < 12; i++){
    for(int j = 0; j < 12; j++){
      if(i==0 || i==11 || j==0 || j==11) map[i][j] = 2;//walls
      else map[i][j] = (int)random(2);// 0(empty) or 1(rubbish)
      //mapsave[i][j] = map[i][j];
    }
  }
}

void showMap(){
  rectMode(CORNER);
  for (int i = 0; i < 12; i++){
    for (int j = 0; j < 12; j++){
      if ( map[i][j] == 0 ) fill(255);
      else if  ( map[i][j] == 2) fill(0);
      else fill(0,0,255);
      rect( i * 50, j * 50, 50, 50);
    }
  }
}

class Robot{
  int xpos;
  int ypos;
  int score;
  String gene;
  
  public Robot(){
    xpos = 6;
    ypos = 6;
    gene = "321444223555544555411531542323641323555444555633641625124424455555554455511462145121416342515141111161531432111144143111411515544332124121462611555562414464664622421426225551554555654656635421646531555353351113114544454445541511531635613415242";
    score = 0;
  }
   
  int detect(){
    return  81 * map[xpos][ypos-1] + 27 * map[xpos-1][ypos] + 9 * map[xpos][ypos] + 3 * map[xpos+1][ypos] + map[xpos][ypos+1];
  }
  
  void operate(char command){//commandIndex: 1 up, 2 down, 3 left, 4 right, 5 pick, 6 randomMove
    if (command == '6') command = (char)(48+(int)random(1,5));
    if (command == '1'){
      if(map[xpos][ypos-1] == 2) score -= 5;
      else ypos -= 1;
    }
    else if (command == '2'){
      if(map[xpos][ypos+1] == 2) score -= 5;
      else ypos += 1;
    }
    else if (command == '3'){
      if(map[xpos-1][ypos] == 2) score -= 5;
      else xpos -= 1;  
    }
    else if (command == '4'){
      if(map[xpos+1][ypos] == 2) score -= 5;
      else xpos+=1;  
    }
    else if (command == '5'){
      if(map[xpos][ypos] == 1){
        score += 10;
        map[xpos][ypos] = 0;
      }
      else score -= 1;
    }
  }
  
  void operate(){//commandIndex: 1 up, 2 down, 3 left, 4 right, 5 pick, 6 randomMove
    char command = gene.charAt(detect());
    if (command == '6') command = (char)(48+(int)random(1,5));
    if (command == '1'){
      if(map[xpos][ypos-1] == 2) score -= 5;
      else ypos -= 1;
    }
    else if (command == '2'){
      if(map[xpos][ypos+1] == 2) score -= 5;
      else ypos += 1;
    }
    else if (command == '3'){
      if(map[xpos-1][ypos] == 2) score -= 5;
      else xpos -= 1;  
    }
    else if (command == '4'){
      if(map[xpos+1][ypos] == 2) score -= 5;
      else xpos+=1;  
    }
    else if (command == '5'){
      if(map[xpos][ypos] == 1){
        score += 10;
        map[xpos][ypos] = 0;
      }
      else score -= 1;
    }
  }
  
  void show(){
    fill(0, 192, 0);
    ellipse(xpos * 50 + 25, ypos * 50 + 25, 30, 30);
  }
  
}
