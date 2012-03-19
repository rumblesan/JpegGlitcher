
GlitchJpeg glitch;
PImage jpegImage;

void setup() {
  size(800,600);
  String imgFile = "testcard.jpg";
  glitch = new GlitchJpeg();
  glitch.readImage(imgFile);

  jpegImage = new PImage(glitch.getImage());
}


void draw() {
  background(200);
}

void mouseClicked() {
  //glitch.glitchImage(1, 200);
  image(jpegImage, 0, 0);
}
