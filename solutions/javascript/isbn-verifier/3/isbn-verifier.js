//
// This is only a SKELETON file for the 'ISBN Verifier' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const isValid = inp => {
  let isbn = inp.replaceAll('-', '').split("");
  if (isbn.length != 10) {
    return false
  }
  if (isbn[9] === "X") isbn[9] = 10;
  return isbn.reduce((acc, val, ix) => val * (10 - ix) + acc, 0) % 11 === 0;
};

