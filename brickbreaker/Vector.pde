class Vector {
  float x;
  float y;
 
  public Vector(float x, float y) {
    this.x = x;
    this.y = y; 
  }
 
  void add(Vector v) {
    x += v.x;
    y += v.y; 
  }
  
}
