
import java.awt.Toolkit;

class GlitchJpeg {

    int normalData[];
    int glitchData[];

    PImage jpegImage;

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
        for ( int i = 0; i < input.length; i++) {
            output[i] = input[i] & 0xff;
        }
        return output;
    }

    byte[] convertIntsToBytes(int[] input) {
        byte[] output = new byte[input.length];
        for ( int i = 0; i < input.length; i++) {
            output[i] = byte(input[i]);
        }
        return output;
    }

    PImage getNormalImage() {
        byte[] imgData = convertIntsToBytes(normalData);
        getImage(imgData);
        return jpegImage;
    }


    PImage getGlitchImage() {
        byte[] imgData = convertIntsToBytes(glitchData);
        getImage(imgData);
        return jpegImage;
    }

    boolean getImage(byte[] imgData) {
        try {
            Image img = Toolkit.getDefaultToolkit().createImage(imgData);

            while (img.getHeight (null) == -1)
            {
                delay(25);
            }

            jpegImage = new PImage(img);
        } 
        catch ( Exception e ) {
            println("Error loading image");
            return false;
        }
        return true;
    }


    void glitchImage(float chance, int offset) {
        glitchData = glitch(normalData, chance, offset);
    }

    int[] glitch(int[] input, float chance, int offset) {
        int[] output = new int[input.length];
        for ( int i = 0; i < input.length; i++) {
            if ( ((random(100000)/1000) < chance) && (i > offset) ) {
                output[i] = int(random(256));
            } 
            else {
                output[i] = input[i];
            }
        }
        return output;
    }
}

