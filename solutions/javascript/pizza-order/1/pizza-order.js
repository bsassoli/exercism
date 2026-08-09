/// <reference path="./global.d.ts" />
//
// @ts-check

/**
 * Determine the prize of the pizza given the pizza and optional extras
 *
 * @param {Pizza} pizza name of the pizza to be made
 * @param {Extra[]} extras list of extras
 *
 * @returns {number} the price of the pizza
 */
export function pizzaPrice(pizza, ...extras) {
  if (extras.length === 0) {
    switch (pizza) {
      case "Margherita":
        return 7;
      case"Caprese":
        return 9;
      case "Formaggio":
        return 10;
      default:
        return "No such pizza";
    }
  } else {
    switch (extras.pop()) {
      case "ExtraSauce":
          return 1 + pizzaPrice(pizza, ... extras);
      case "ExtraToppings":
          return 2 + pizzaPrice(pizza, ... extras);
      default:
          return "No such extra";
    }
  }
}
/**
 * Calculate the prize of the total order, given individual orders
 *
 * @param {PizzaOrder[]} pizzaOrders a list of pizza orders
 * @returns {number} the price of the total order
 */
export function orderPrice(pizzaOrders) {
  return pizzaOrders.reduce((acc, order) => acc + pizzaPrice(order.pizza, ...order.extras), 0);
}
