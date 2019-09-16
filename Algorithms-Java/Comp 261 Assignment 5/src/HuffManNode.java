public class HuffManNode  implements Comparable <HuffManNode> {

    Character character;
    private HuffManNode left;
    private HuffManNode right;
    private int frequency;

    public HuffManNode(int frequency, HuffManNode left, HuffManNode right){
        //this.character = character;
        this.frequency = frequency;
        this.left = left;
        this.right = right;
    }

    public int compareTo(HuffManNode other){
        if(this.frequency < other.frequency){ return -1; }
        else if(this.frequency > other.frequency){ return 1; }
        else { return 0; }
    }

    public String toString(){
        return "";
    }

    //getters and setters
    public void setCharacter(Character character) {this.character = character;}
    public int getFrequency(){ return frequency; }
    public HuffManNode getLeft() {return left;}
    public HuffManNode getRight() {return right;}

}
