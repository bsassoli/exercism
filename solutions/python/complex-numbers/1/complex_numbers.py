import math


class ComplexNumber:
    def __init__(self, real, imaginary):
        self.imaginary = imaginary
        self.real = real

    def __eq__(self, other):
        return self.real == other.real and self.imaginary == other.imaginary

    def __add__(self, other):
        if isinstance(other, int):
            return ComplexNumber(self.real + other, self.imaginary)
        return ComplexNumber(self.real + other.real, self.imaginary + other.imaginary)

    def __radd__(self, other):
        return self.__add__(other)

    def __mul__(self, other):
        if isinstance(other, int):
            return ComplexNumber(self.real * other, self.imaginary * other)
        return (
            ComplexNumber(
                self.real * other.real - self.imaginary * other.imaginary,
                self.real * other.imaginary + self.imaginary * other.real,)
            )

    def __rmul__(self, other):
        return self.__mul__(other)

    def __sub__(self, other):
        if isinstance(other, int):
            return ComplexNumber(self.real - other, self.imaginary)
        return ComplexNumber(self.real - other.real, self.imaginary - other.imaginary)

    def __rsub__(self, other):
        if isinstance(other, int):
            return ComplexNumber(other - self.real, -self.imaginary)
        return NotImplemented

    def __truediv__(self, other):
        if isinstance(other, int):
            return ComplexNumber(self.real / other, self.imaginary / other)
        return (
            ComplexNumber(
                (self.real * other.real + self.imaginary * other.imaginary) / (other.real ** 2 + other.imaginary ** 2),
                (self.imaginary * other.real - self.real * other.imaginary) / (other.real ** 2 + other.imaginary ** 2),
            )
        )

    def __rtruediv__(self, other):
        if isinstance(other, int):
            denominator = self.real ** 2 + self.imaginary ** 2
            return ComplexNumber(
                (other * self.real) / denominator,
                (-other * self.imaginary) / denominator
            )
        if isinstance(other, int):
            denominator = self.real ** 2 + self.imaginary ** 2
            return ComplexNumber(
                (other * self.real) / denominator,
                (-other * self.imaginary) / denominator
            )
        return NotImplemented

    def __abs__(self):
        return (self.real ** 2 + self.imaginary ** 2) ** 0.5

    def conjugate(self):
        return ComplexNumber(self.real, -self.imaginary)

    def exp(self):
        return ComplexNumber(
            math.e ** self.real * math.cos(self.imaginary),
            math.e ** self.real * math.sin(self.imaginary),
        )
