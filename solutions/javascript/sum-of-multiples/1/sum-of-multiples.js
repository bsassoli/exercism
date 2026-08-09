//
// This is only a SKELETON file for the 'Sum Of Multiples' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const sum = (candidates, num) => {
  var acc = 0;
  const arr = Array.from({length: num - 1}, (_, i) => i + 1);
  const checkMultiples = (candidates, num) => {
    return [...new Set(candidates.map(item => {
      return num % item === 0 ? num  : 0
    }))];
  }
  const sumMultiples = arr => arr.reduce((item, acc) => item + acc, 0); 
  arr.forEach(item => acc += sumMultiples(checkMultiples(candidates, item)));
  return acc
};
