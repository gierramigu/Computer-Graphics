import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.PriorityQueue;

/**
 * A new instance of HuffmanCoding is created for every run. The constructor is
 * passed the full text to be encoded or decoded, so this is a good place to
 * construct the tree. You should store this tree in a field and then use it in
 * the encode and decode methods.
 */
public class HuffmanCoding {
	/**
	 * This would be a good place to compute and store the tree.
	 */
	public HuffManNode root;
	private String text;
	public static final int ASCII = 256;
	private Map<String, Character> decodeMap = new HashMap<>();
	private Map<Character, HuffManNode> encodeMap = new HashMap<>();
	private HuffManNode rootNode;
	private Map<String, String > codeMap = new HashMap<>();


	public HuffmanCoding(String text) {

		this.text = text;
		HashMap<Character,Integer> freqMap = new HashMap<>(checkFrequency(text));
		PriorityQueue<HuffManNode> nodes = new PriorityQueue<HuffManNode>();

		//creating the leave nodes in the tree (only dealing with leafNodes)
		for(Character c: freqMap.keySet()){
			HuffManNode n1 = new HuffManNode(freqMap.get(c), null, null);
			n1.setCharacter(c);
			nodes.offer(n1); //taking in the character leaf node and puts it in the queue to check its frequency
			encodeMap.put(c, n1);
		}

		while(nodes.size() > 1){
			//takes the first two nodes in queue that has the highest frequency, the compareTo method sorts this out and prioritizes the frequency
			HuffManNode leftNode = nodes.poll();
			HuffManNode rightNode = nodes.poll();
			int frequency = leftNode.getFrequency() + rightNode.getFrequency();
			HuffManNode parentNode = new HuffManNode(frequency, leftNode, rightNode); //creates the parentNode and parentNode is the total of the two leaf frequencies
			nodes.offer(parentNode); //offer the parentNode into the queue, so it can be compared to all other parent nodes, keep stacking up the parent nodes up to the root
		}
		rootNode = nodes.peek(); //since its in the top of the queue.
	}

//	//create the tree itself first
//	public HuffManNode buildHuffManTree(){
//		return null;
//	}

	//calculates the frequences for each character and stores them in a Map
	public HashMap<Character, Integer> checkFrequency (String text){
		HashMap<Character,Integer> temp = new HashMap<>();
		char[] textArray = text.toCharArray();
		for(char c: textArray){
			if(temp.containsKey(c)){
				temp.put(c, temp.get(c) + 1 );
			}
			else{temp.put(c,1);}
		}

		return temp;
	}

	public void codeSetter (HuffManNode node, String code){
		//if the node coming in is a leaf node
		if(node.getLeft() == null && node.getRight() == null){
			//creating a Map to what binary code refers to what character
			codeMap.put(node.character.toString(), code);
			//holds the code and the character
			decodeMap.put(code, node.character);
			return;
		}

		//otherwise if the node is a parent then assign 0 and 1 binary codes
		if(node.getLeft() !=null && node.getRight() !=null ){
			HuffManNode leftNode = node.getLeft();
			HuffManNode rightNode = node.getRight();

			//calling this method recursively and traversing down the tree and assign the nodes 1s and 0s
			codeSetter(leftNode, code + "0");
			codeSetter(rightNode, code + "1");
		}
	}

	/**
	 * Take an input string, text, and encode it with the stored tree. Should
	 * return the encoded text as a binary string, that is, a string containing
	 * only 1 and 0.
	 */

	public String encode(String text) {
		char[] textArray = text.toCharArray();
		//rootNode starts off empty
		codeSetter(rootNode, "");
		//String builder: easily appends string together so we can just return a string at the end
		StringBuilder std = new StringBuilder();
		for(char c : textArray){
			String code = codeMap.get(Character.toString(c));
			std.append(code);
		}

		System.out.println("encode: " + std.toString());
		return std.toString();
	}

	/**
	 * Take encoded input as a binary string, decode it using the stored tree,
	 * and return the decoded text as a text string.
	 */
	public String decode(String encoded) {
		char[] array = encoded.toCharArray();
		StringBuilder cha = new StringBuilder(); //stores the character each time
		StringBuilder decodeText = new StringBuilder();

		for(Character c: array){
			cha.append(c);
			if(decodeMap.containsKey(cha.toString())){
				decodeText.append(decodeMap.get(cha.toString()));
				cha = new StringBuilder(); //clears for the next character since we are only holding one character each time
			}
		}
//		System.out.println("\n");
//		for(String key: codeMap.keySet()){
//			System.out.println("Character: " + key + " " + "code: " + codeMap.get(key));
//		}

		System.out.println("Decode: " + decodeText.toString());
		return decodeText.toString();

	}

	/**
	 * The getInformation method is here for your convenience, you don't need to
	 * fill it in if you don't wan to. It is called on every run and its return
	 * value is displayed on-screen. You could use this, for example, to print
	 * out the encoding tree.
	 */
	public String getInformation() {

		return "";
	}

	//class for the huffManTree
	private class HuffManTree{
		private HuffManNode root;

		public HuffManTree(HuffManNode root){
			this.root = root;
		}

	}


}
