
class DataSection {
    int data[];
    int tableSize;
}

class HuffmanTable {
    int data[];
    int tableSize;

    int marker = unhex("C4");
}

class QuantizeTable {
    int data[];
    int tableSize;

    int marker = unhex("DB");
}

class ScanData {
    int data[];
    int dataSize;

    int marker = unhex("DA");
}

class Header {
    int data[];
    int dataSize;

    int marker = unhex("E0");
}

class Comment {
    int data[];
    int dataSize;

    int marker = unhex("FE");
}

class BaselineFrame {
    int data[];
    int dataSize;

    int marker = unhex("C0");
}

