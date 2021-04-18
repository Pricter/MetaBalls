Blob[] blobs = new Blob[10];

void setup() {
  size(640, 360);
  for(int i = 0; i < blobs.length; i++) {
    blobs[i] = new Blob(random(width), random(height));
  }
}

void draw() {
  background(51);
  
  loadPixels();
  for(int x = 0; x < width; x++) {
    for(int y = 0; y < height; y++) {
      float sum = 0;
      int index = x + y * width;
      for(Blob b : blobs) {
        float d = dist(x, y, b.pos.x, b.pos.y);
        sum += 100 * b.r / d;
      }
      
      pixels[index] = color(sum);
    }
  }
  updatePixels();
  
  for(Blob b : blobs) {
    b.update();
    // b.show();
  }
}
