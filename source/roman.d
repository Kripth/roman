
module roman;

/**
 * Converts a roman number to an integer.
 * Returns: the number as integer or 0 on invalid numbers.
 */
uint fromRoman(string str) pure nothrow @safe @nogc {
	if(str.length) {
		immutable two = str.length > 1;
		if(str[0] == 'M') return 1000 + str[1..$].fromRoman;
		else if(two && str[0..2] == "CM") return 900 + str[2..$].fromRoman;
		else if(str[0] == 'D') return 500 + str[1..$].fromRoman;
		else if(two && str[0..2] == "CD") return 400 + str[2..$].fromRoman;
		else if(str[0] == 'C') return 100 + str[1..$].fromRoman;
		else if(two && str[0..2] == "XC") return 90 + str[2..$].fromRoman;
		else if(str[0] == 'L') return 50 + str[1..$].fromRoman;
		else if(two && str[0..2] == "XL") return 40 + str[2..$].fromRoman;
		else if(str[0] == 'X') return 10 + str[1..$].fromRoman;
		else if(two && str[0..2] == "IX") return 9 + str[2..$].fromRoman;
		else if(str[0] == 'V') return 5 + str[1..$].fromRoman;
		else if(two && str[0..2] == "IV") return 4 + str[2..$].fromRoman;
		else if(str[0] == 'I') return 1 + str[1..$].fromRoman;
	}
	return 0;
}

///
pure nothrow @safe @nogc unittest {

	assert(fromRoman("I") == 1);
	assert(fromRoman("III") == 3);
	assert(fromRoman("IV") == 4);
	assert(fromRoman("V") == 5);
	assert(fromRoman("XLI") == 41);
	assert(fromRoman("MM") == 2000);

	// invalids
	assert(fromRoman("A") == 0);

}

/**
 * Converts an integer to a roman number.
 * Returns: A roman number or an empty string if the given number could not be converted.
 */
string toRoman(uint num) {
	string ret = "";
	while (num >= 1000) {
		ret ~= "M";
		num -= 1000;
	}
	while (num >= 900) {
		ret ~= "CM";
		num -= 900;
	}
	while (num >= 500) {
		ret ~= "D";
		num -= 500;
	}
	while (num >= 400) {
		ret ~= "CD";
		num -= 400;
	}
	while (num >= 100) {
		ret ~= "C";
		num -= 100;
	}
	while (num >= 90) {
		ret ~= "XC";
		num -= 90;
	}
	while (num >= 50) {
		ret ~= "L";
		num -= 50;
	}
	while (num >= 40) {
		ret ~= "XL";
		num -= 40;
	}
	while (num >= 10) {
		ret ~= "X";
		num -= 10;
	}
	while (num >= 9) {
		ret ~= "IX";
		num -= 9;
	}
	while (num >= 5) {
		ret ~= "V";
		num -= 5;
	}
	while (num >= 4) {
		ret ~= "IV";
		num -= 4;
	}
	while (num >= 1) {
		ret ~= "I";
		num -= 1;
	}    
	return ret;
}

///
unittest {

	assert(toRoman(1) == "I");
	assert(toRoman(3) == "III");
	assert(toRoman(4) == "IV");
	assert(toRoman(5) == "V");
	assert(toRoman(9) == "IX");
	assert(toRoman(10) == "X");
	assert(toRoman(33) == "XXXIII");
	assert(toRoman(1111) == "MCXI");
	assert(toRoman(1999) == "MCMXCIX");
	assert(toRoman(550) == "DL");
	assert(toRoman(400) == "CD");
	assert(toRoman(40) == "XL");

	// invalid
	assert(toRoman(0) == "");

}
