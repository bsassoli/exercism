class Node:
    def __init__(self, value, next=None):
        self._value = value
        self._next = next
    
    def __repr__(self):
        return f"value: {self._value}, next: {self._next}"
    
    def __eq__(self, other):
        return isinstance(other, Node) and self._value == other._value and self._next == other._next
    
    def __str__(self) -> str:
        return f"{self._value}"
    
    def value(self):
        return self._value

    def next(self):
        return self._next

class LinkedList:
    def __init__(self, values=[]):
        self._head = None
        for value in values:
            self.push(value)


    def __str__(self):
        nodes = []
        for node in self:
            nodes.append(str(node))
        return "->".join(nodes)

    def __len__(self):
        count = 0
        if self._head is not None:
            current = self._head
            while current:
                count += 1
                current = current.next()
        return count
    
    def __iter__(self):
        self.iter_next = self._head
        return self

    def __next__(self):
        if self.iter_next:
            value = self.iter_next.value()
            self.iter_next = self.iter_next._next
            return value
        else:
            raise StopIteration


    def head(self):
        if self._head is not None:
            return self._head
        raise EmptyListException()

    def push(self, value):
        new_head = Node(value)
        if self._head:
            new_head._next = self._head
        self._head = new_head

    def pop(self):
        if self._head:
            current = self._head._value
            self._head = self._head._next
            return current
        else:
            raise EmptyListException


    def reversed(self):
        ll = list(self)
        return LinkedList(ll)


class EmptyListException(Exception):
    def __init__(self, message="The list is empty."):
        self.message = message
        super().__init__(self.message)
