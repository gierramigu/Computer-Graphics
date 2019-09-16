/**
 * A new KMP instance is created for every substring search performed. Both the
 * pattern and the text are passed to the constructor and the search method. You
 * could, for example, use the constructor to create the match table and the
 * search method to perform the search itself.
 */
public class KMP {
	String pattern;
	String text;
	int [] matchTable;

	public KMP(String pattern, String text) {
		this.pattern = pattern;
		this.text = text;
	}

	/**
	 * Perform KMP substring search on the given text with the given pattern.
	 * 
	 * This should return the starting index of the first substring match if it
	 * exists, or -1 if it doesn't.
	 */
	public int search(String pattern, String text) {

		long start = System.nanoTime();
		this.matchTable = buildMatchTable(pattern);
		int k = 0; //start of current match in Text
		int i = 0; //position of current character in Pattern
		int n = text.length();
		int m = pattern.length();

		while(k + i < n){
			if(pattern.charAt(i) == text.charAt(k + i )){
				i++;
				if(i == m) {
					System.out.printf("KMP Search Time: %.5f\n", (System.nanoTime() - start)/ 10000000000.0);
					return k;
				}
			}
			else if (this.matchTable[i] == -1){
				i = 0;
				k = k + i + 1;
			}
			else {
				k = k + i - this.matchTable[i];
				i = this.matchTable[i];
			}
		}
		return -1;
	}

	public int[] buildMatchTable(String pattern){

		int [] matchTable = new int[pattern.length()];

		//initialise
		int patternLength = pattern.length();
		matchTable[0] = -1;
		matchTable[1] = 0;
		int j = 0; //position in prefix
		int pos = 2; //position in table

		while(pos < patternLength){
			if(pattern.charAt(pos -1) == pattern.charAt(j)){ //if substrings pos-1 and j = 0 match
				matchTable[pos] = j + 1;
				pos++;
				j++;
			}
			else if (j >0){ //mismatch, so restart the prefix
				j = matchTable[j];
			}
			else { // j= 0;
				matchTable[pos] = 0;
				pos++;
			}
		}

		return matchTable;
	}


	public int bruteForceSearch (String pattern, String text){
		//for k ← 0 to T.length() - S.length()
		//if T.substring(k, S.length()).equals(S) then return k
		//return -1

		//for k ← 0 to n-m
		//found ← true
		//for i ← 0 to m-1
		//if S[i] != T[k+i] then found ← false,
		//break
		//if found then return k
		// return -1
       long start = System.nanoTime();
		int m = pattern.length();
		int n = text.length();

		for(int k = 0; k <= n-m; k++){
			boolean found = true;
			for(int i = 0; i <= m-1; i++){
				if(pattern.charAt(i) != text.charAt(k+i)){
					found = false;
					break;
				}
			}
			if(found){
				System.out.printf("Brute Search Time: %.5f\n", (System.nanoTime() - start)/ 10000000000.0);
				return k;
			}
		}
		return -1;
	}
}
