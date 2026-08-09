/// <reference path="./global.d.ts" />
// @ts-check

/**
 * Implement the functions needed to solve the exercise here.
 * Do not forget to export them so they are available for the
 * tests. Here an example of the syntax as reminder:
 *
 * export function yourFunction(...) {
 *   ...
 * }
 */
export function cookingStatus(minutes) {
  return typeof(minutes) === 'undefined' ? 'You forgot to set the timer.' : minutes == 0 ? 'Lasagna is done.' : 'Not done, please wait.'
}

export function preparationTime(layers, avgTime) {
  return typeof(avgTime) === 'undefined' ?  layers.length * 2 : avgTime * layers.length
}

export function quantities(layers) {
  var result = {noodles: 0, sauce: 0};
  for (const layer of layers) {
    switch(layer) {
      case "noodles":
        result.noodles += 50;
        break;
      case "sauce":
        result.sauce += 0.2;
        break;
      default:
    }
  }
  return result;
}

export function addSecretIngredient(friendsList, myList) {
  myList.push(friendsList.slice(-1)[0]);
}

export function scaleRecipe(recipe, factor) {
  var new_recipe = {};
  for (var item in recipe) {
     new_recipe[item] = recipe[item] / 2 * factor
  }
  return new_recipe;
}