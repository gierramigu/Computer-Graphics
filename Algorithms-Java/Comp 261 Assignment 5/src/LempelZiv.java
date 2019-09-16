import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;

/**
 * A new instance of LempelZiv is created for every run.
 */
public class LempelZiv {

	int windowSize = 100;
	/**
	 * Take uncompressed input as a text string, compress it, and return it as a
	 * text string.
	 */
	public String compress(String input) {
		int cursor = 0; //initial cursor
		int length = 0;
		List<Tuple> encodeTexts = new ArrayList<>();
		//StringBuilder stringBuilder = new StringBuilder();
		while(cursor < input.length()){
			//int length = 0;
			//int prevMatch = cursor > windowSize ? windowSize : cursor; //ternary operator; shorthand version of if-else statements
			//loop
			length = (cursor + length >= input.length()) ? input.length() : cursor + length;
			int previousMatch = (cursor - windowSize < 0) ? 0 : cursor - windowSize;
			int match = 1;
			int matchLocation = 0;
			String string = (cursor == 0) ? "" : input.substring(previousMatch, cursor);
			String nextMatch = input.substring(cursor, cursor + match);
			if(string.contains(nextMatch)) {
				while (match <= length) {
					match++;
					//if match succeeded
					if (cursor + match >= input.length() - 1) {
						match = 1;
						break;
					}
					nextMatch = input.substring(cursor, cursor + match);
					matchLocation = string.indexOf(nextMatch);
					if (match + cursor < input.length() && matchLocation > -1) { match++; }
					else { break; }
				}
				match--;
				matchLocation = string.indexOf(input.substring(cursor, cursor + match));
				cursor += match;

				char character = input.charAt(cursor);
				int offset = windowSize - matchLocation;

				if (match + windowSize >= cursor) { offset = cursor - matchLocation - match; }
				encodeTexts.add(new Tuple(offset, match, character));

			} else{
				char character = input.charAt(cursor);
				encodeTexts.add(new Tuple(0,0, character));
			}
				cursor++;
			}
		return convertListToString(encodeTexts);
	}


//	private int stringMatch(String input, int cursor, int length){
//		int searchStart;
//		int textSize = input.length();
//		if( cursor - windowSize < 0){ searchStart = 0; }
//		else { searchStart = cursor - windowSize; }
//		String searchBuffer = input.substring(searchStart, cursor); //(int, beginIndex)
//
//		//if out of bounds
//		if(cursor + length +1 > textSize){
//			return -1; //no match string because out of bounds
//		}
//
//		String lookAheadBuffer = input.substring(cursor, cursor + length+ 1);
//		return 1;
//	}

	public static String convertListToString(List<Tuple> list){
		String result = "";
		for (int i = 0; i < list.size(); i++) {
			result += "|" + list.get(i);
		}
		return result;
	}

	/**
	 * Take compressed input as a text string, decompress it, and return it as a
	 * text string.
	 */
	public String decompress(String compressed) {
		return "";
	}

	/**
	 * The getInformation method is here for your convenience, you don't need to
	 * fill it in if you don't want to. It is called on every run and its return
	 * value is displayed on-screen. You can use this to print out any relevant
	 * information from your compression.
	 */
	public String getInformation() {
		return "";
	}

	private class Tuple {
		public int offset;
		public int length;
		public char character;

		Tuple(int offset, int length, char character){
			this.offset = offset;
			this.length = length;
			this.character = character;
		}

		public String toString() {
			return "[" + this.offset + "|" + this.length + "|" + this.character + "]";
		}


	}
}
