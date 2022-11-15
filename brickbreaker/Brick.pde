class Brick {
 
  Vector location;
  float bWidth; 
  float bLength;  
  color c;
  boolean broken;

  public Brick(Vector l, float w, float len, color c) {
    location = l;
    bWidth   = w;
    bLength  = len;
    this.c   = c;
    broken   = false;
  }
 
  void display() {
    fill(c);
    rect(location.x, location.y, bWidth, bLength);
  }
 
  Vector getLocation() {
    return location; 
  }
 
  void setLocation(Vector v) {
    location = v;
  }
 
  float getWidth() {
    return bWidth;
  }
 
  float getLength() {
    return bLength; 
  }
 
  void breakBrick() {
    this.setLocation(new Vector(-100,-100));
    broken = true;
  }
 
  String toString() {
    return "x: " + location.x + " y: " + location.y + " width: " + bWidth + " length: " + bLength;
  }
 
}
