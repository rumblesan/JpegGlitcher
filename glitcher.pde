
GlitchJpeg glitch;

PImage jpegImage;

void setup() {
    size(800, 600);
    String imgFile = "testcard.jpg";
    glitch = new GlitchJpeg();
    glitch.readImage(imgFile);
}


void draw() {
}

void mouseClicked() {
    background(200);
    glitch.glitchImage(0.01, 100);
    jpegImage = glitch.getGlitchImage();
    //jpegImage = glitch.getNormalImage();
    image(jpegImage, 0, 0);
}

