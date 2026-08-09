from collections import deque


class BufferFullException(BufferError):
    """Exception raised when CircularBuffer is full.

    message: explanation of the error.

    """
    def __init__(self, message):
        self.message = message


class BufferEmptyException(BufferError):
    """Exception raised when CircularBuffer is empty.

    message: explanation of the error.

    """
    def __init__(self, message):
        self.message = message


class CircularBuffer:
    def __init__(self, capacity):
        self.capacity = capacity
        self.queue = deque(maxlen=self.capacity)

    def read(self):
        if self.empty():
            raise BufferEmptyException("Circular buffer is empty")
        return self.queue.popleft()

    def write(self, data):
        if self.full():
            raise BufferFullException("Circular buffer is full")
        self.queue.append(data)
        return self.queue

    def overwrite(self, data):
        if not self.full():
            self.write(data)
        else:
            self.read()
            self.write(data)

    def clear(self):
        self.queue = deque(maxlen=self.capacity)

    def full(self):
        return len(self.queue) == self.capacity

    def empty(self):
        return len(self.queue) == 0

    def __str__(self):
        return "->".join([str(item) for item in self.queue])
