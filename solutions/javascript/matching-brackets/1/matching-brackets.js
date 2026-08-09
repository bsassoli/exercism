//
// This is only a SKELETON file for the 'Matching Brackets' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const isPaired = (str) => {
  let stack = [];
  for (let char of str) {
    if (["[", "(", "{"].includes(char))
    {
      stack.unshift(char);
    }
    else if ((["]", ")", "}"].includes(char)))
    {
      let last = stack.shift();
      if (!matches(char, last))
      return false;
    }
  }
return stack.length === 0;
};

const matches = (b, a) => { 
  return (a==="(" && b===")") || (a==="{" && b ==="}") || (a==="[" && b==="]")
}