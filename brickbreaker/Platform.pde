class Platform {
  
  Vector location;
  Vector velocity;
  float pWidth;  
  float pLength;  
  color c;
  
  public Platform(Vector l, Vector v, float w, float len, color c) {
    location = l;
    velocity = v;
    pWidth   = w;
    pLength  = len;
    this.c   = c;
  }
  
  void display() {
    fill(c);
    rect(location.x,location.y,pWidth,pLength);
  }
  
  void move() {
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == RIGHT)
          moveRight();     
          
        if (keyCode == LEFT)
          moveLeft();
      }
    } 
  }

  void moveRight() {
    if (this.location.x + pWidth <= width - 25)
      location.x += 5;
  }
  
  void moveLeft() {
    if (this.location.x >= 25)
      location.x -= 5;
  }
  
  Vector getLocation() {
    return location; 
  }
  
  float getWidth() {
    return pWidth; 
  }
  
  float getLength() {
    return pLength; 
  }
  
  void returnToOrigin() {
    this.setLocation(new Vector(width/2 - pLength, 350));
  }
  
  void setLocation(Vector v) {
    this.location = v; 
  }
  
 
}
