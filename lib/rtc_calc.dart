
class RtcCalc {
  
  String playerName = "";
  int playerID = 0;
  int playerMoney = 0;

  static const letters = [' ', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '(', ')', ':', ';', '[', ']', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '{', '}', '-', '?', '!', '.', '*', '/', ','];
  static const codes = [0, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 225, 226, 227, 230, 231, 232, 241, 243, 244];


  int codify(int val) {
    val %= 65535;
    return (val ~/ 256) + val % 256;
  }

  String get resetCode {

    // The password requires three different values to be added together: from the player name, from the trainer ID, and from the player's money balance.

    var nameCode = 0;
    for (int i = 0; i < 5; i++) {
      if (i >= playerName.length) {
        break;
      }
      nameCode += letters.contains(playerName[i])?codes[letters.indexOf(playerName[i])]:0;
    }

    String result = (
      nameCode +					// Name code
      codify( playerID ) +	// Trainer ID code
      codify( playerMoney )	// Money code
    ).toString();

    while (result.length < 5) {
      result = '0$result';		// Pad result with leading "0"s
    }

    return result;
  }
}
