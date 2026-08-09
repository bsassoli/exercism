//
// This is only a SKELETON file for the 'Pangram' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const isPangram = phrase => {

  return new Set(phrase.split("").filter(char => char.toLowerCase() != char.toUpperCase()).map(char => char.toLowerCase())).size === 26;
};
