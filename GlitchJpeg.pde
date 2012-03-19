
import java.awt.Toolkit;

class GlitchJpeg {
 
 String filename;
 
 int data[];
 int glitchData[];
 
 ArrayList huffman;
 ArrayList quantize;
 ArrayList scan;
 
 Image jpegImage;
 
 GlitchJpeg() {
 }
 
 void readImage(String inputFile) {
   filename = inputFile;
   byte binData[] = loadBytes(filename);
   convertBytesToInts(binData);
   glitchData = new int[data.length];
 }
 
 void saveImage(String outputFile) {
   saveBytes(outputFile, convertIntsToBytes());
 }
 
 Image getImage() {
   jpegImage = Toolkit.getDefaultToolkit().createImage(convertIntsToBytes());
   while (jpegImage.getHeight(null) == -1)
   {
     delay(25); // Don't hog CPU!
   }
   return jpegImage;
 }
 
 void convertBytesToInts (byte binData[]) {
   data = new int[binData.length];
   for( int i = 0; i < binData.length; i++) {
     data[i] = binData[i] & 0xff;
   }
 }
 
 byte[] convertIntsToBytes() {
   byte[] output = new byte[glitchData.length];
   for( int i = 0; i < glitchData.length; i++) {
     output[i] = byte(glitchData[i]);
   }
   return output;
 }
 
 void glitchImage(float chance, int offset) {
   int val;
   for( int i = 0; i < data.length; i++) {
     val = data[i];
     if ( ((random(1000)/10) < chance) && (i > offset) ) {
         val = int(random(256));
     }
     glitchData[i] = val;
   }
 }
 
 void parseData() {
   int cval, nval;
   for( int i = 0; i < data.length; i++) {
     
   }
 }
  
}

