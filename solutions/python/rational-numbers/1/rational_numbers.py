""" Implements Rational class for representing fractions.
"""
from math import gcd


class Rational:
    """Implements rational numbers ranging over (-inf, +inf).
    Zero is represented as (0, 1).
    """

    def __init__(self, numerator, denominator=1):
        """Constructs a Rational from a numerator: int and an (optional) denominator: int.
        If the second param is zero, it raises a ValueError.
        Converts signs to account for fractions where both are negative.
        """
        if not isinstance(numerator, int):
            raise ValueError(
                f"Numerator should be of type int: you entered {numerator}"
            )
        if not isinstance(denominator, int) or denominator == 0:
            raise ValueError(
                f"Denominator should be a positive integer: you entered {denominator}"
            )
        if numerator < 0 and denominator < 0:
            self._denominator = abs(denominator)
            self._numerator = abs(numerator)
        elif denominator < 0 < numerator:
            self._denominator = abs(denominator)
            self._numerator = -numerator
        else:
            self._numerator = numerator
            self._denominator = denominator

    @property
    def numerator(self):
        """numerator getter method
        Returns:
            int: the numerator
        """
        return self._numerator

    @numerator.setter
    def numerator(self, val):
        """numerator setter method. Accepts an int."""
        if isinstance(val, int):
            self._numerator = val
        else:
            raise ValueError(f"Numerator should be of type int: you entered {val}")

    @property
    def denominator(self):
        """denominator getter method
        Returns:
            int: the denominator
        """
        return self._denominator

    @denominator.setter
    def denominator(self, val):
        """denominator setter method. Accepts an int."""
        if not isinstance(val, int) or val == 0:
            raise ValueError(
                f"Denominator should be a positive integer: you entered {val}"
            )
        self._denominator = val

    def __str__(self):
        """Prints a rational in string format"""
        if self._numerator == 0 and self._denominator == 1:
            return "0"
        return f"{self._numerator}/{self._denominator}"

    def __repr__(self):
        """Prints a rational in string format for debugging"""
        return f"Rational ({self._numerator}/{self._denominator})"

    def __float__(self):
        """Converts a rational to float"""
        return self._numerator / self.denominator

    def __eq__(self, y):
        """Checks for equality"""
        first = self._simplify()
        second = y._simplify()
        return (
            first._numerator == second._numerator
            and first._denominator == second._denominator
        )

    def _simplify(self):
        """Reduces a rational to its simplest form"""
        if self._numerator == 1:
            return self
        gcd_ = gcd(self._numerator, self._denominator)
        if gcd_ and gcd_ != 1:
            self._numerator //= gcd_
            self._denominator //= gcd_
            return self._simplify()
        return self

    def __add__(self, val):
        """Adds two rationals and returns the result in reduced form"""
        if isinstance(val, Rational):
            lcm = val._denominator * self._denominator
            first = Rational(
                self._numerator * val._denominator, self._denominator * val._denominator
            )
            second = Rational(
                val._numerator * self._denominator, val._denominator * self._denominator
            )
            return (Rational(first._numerator + second._numerator, lcm))._simplify()
        raise ValueError(f"You must enter a rational number: you entered {val}")

    def __neg__(self):
        """Turns a rational to its negative"""
        return Rational(-self._numerator, self._denominator)

    def __sub__(self, val):
        """Subtracts two rationals and returns the result in reduced form"""
        if isinstance(val, Rational):
            lcm = val._denominator * self._denominator
            first = Rational(
                self._numerator * val._denominator, self._denominator * val._denominator
            )
            second = Rational(
                val._numerator * self._denominator, val._denominator * self._denominator
            )
            return (Rational(first._numerator - second._numerator, lcm))._simplify()
        raise ValueError(f"You must enter a rational number: you entered {val}")

    def __mul__(self, val):
        """Multiples two rationals and returns the result in reduced form"""
        if isinstance(val, Rational):
            return Rational(
                self._numerator * val._numerator, self._denominator * val._denominator
            )._simplify()
        raise ValueError(f"You must enter a rational number: you entered {val}")

    def __truediv__(self, val):
        """Divides two rationals and returns the result in reduced form"""
        if isinstance(val, Rational):
            if val._numerator == 0:
                raise ZeroDivisionError("Trying to divide by zero")
            return Rational(
                self._numerator * val._denominator, self._denominator * val._numerator
            )._simplify()
        raise ValueError(f"You must enter a rational number: you entered {val}")
    
    def __abs__(self):
        return Rational(abs(self._numerator), abs(self._denominator))

    def __pow__(self, exponent):
        if exponent == 0:
            return(Rational(1, 1))
        if isinstance(exponent, int):
            if  exponent >= 0: 
                return Rational(self._numerator ** exponent, self._denominator ** exponent)
            return Rational(self._denominator ** abs(exponent), self._numerator ** abs(exponent))
        return self._numerator ** exponent / self._denominator ** exponent

    def __rpow__(self, base):
        return base ** (self._numerator / self._denominator)

