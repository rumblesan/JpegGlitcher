
import java.awt.Toolkit;

class GlitchJpeg {
 
 int normalData[];
 int glitchData[];

 Image jpegImage;
 
 GlitchJpeg() {
 }
 
 void readImage(String inputFile) {
   byte[] inputData = loadBytes(inputFile);
   normalData = convertBytesToInts(inputData);
 }
 
 void saveImage(String outputFile) {
   saveBytes(outputFile, convertIntsToBytes(glitchData));
 }

 int[] convertBytesToInts (byte[] input) {
   int[] output = new int[input.length];
   for( int i = 0; i < input.length; i++) {
     output[i] = input[i] & 0xff;
   }
   return output;
 }
 
 byte[] convertIntsToBytes(int[] input) {
   byte[] output = new byte[input.length];
   for( int i = 0; i < input.length; i++) {
     output[i] = byte(input[i]);
   }
   return output;
 }
  
 Image getNormalImage() {
   byte[] imgData = convertIntsToBytes(normalData);
   return getImage(imgData);
 }
 
  
 Image getGlitchImage() {
   byte[] imgData = convertIntsToBytes(glitchData);
   return getImage(imgData);
 }
 
 Image getImage(byte[] imgData) {
   jpegImage = Toolkit.getDefaultToolkit().createImage(imgData);
   while (jpegImage.getHeight(null) == -1)
   {
     delay(25);
   }
   return jpegImage;
 }
 
 
 void glitchImage(float chance, int offset) {
     glitchData = glitch(normalData, chance, offset);
 }
 
 int[] glitch(int[] input, float chance, int offset) {
   int[] output = new int[input.length];
   for( int i = 0; i < input.length; i++) {
     if ( ((random(1000)/10) < chance) && (i > offset) ) {
         output[i] = int(random(256));
     } else {
         output[i] = input[i];
     }
   }
   return output;
 }
 

}

