//
// This is only a SKELETON file for the 'Resistor Color Duo' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const decodedValue = ([first, second, ...rest]) => {
  return parseInt(colorCode(first).toString() + colorCode(second).toString())
};

//
// This is only a SKELETON file for the 'Resistor Color' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const colorCode = color => {
  const colors = {};
  COLORS.map((el, index) => colors[el] = index);
  return colors[color];
};

export const COLORS = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]
