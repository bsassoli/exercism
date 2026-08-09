//
// This is only a SKELETON file for the 'ISBN Verifier' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const isValid = inp => {
  let isbn = inp.replaceAll('-', '');
  isbn = isbn.split("");
  if (isbn.length != 10) {
    return false
  }
  let sum;
  isbn.slice(-1) == "X" ? sum = 10 : sum = parseInt(isbn.slice(-1));
  for (let ix=10; ix > 1; ix--) {
    sum += parseInt(isbn[10-ix]) * ix;
  }
  sum %= 11;
  return sum === 0;
};

