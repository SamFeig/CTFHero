fib_cache = {0:0, 1:1}

def fibonacci(n):
    if n < 0:
        return -1
    if fib_cache.has_key(n):
        return fib_cache[n]
    else:
        fib_cache[n] = fibonacci(n - 1) + (fibonacci(n - 2) % 13371337)
    return fib_cache[n]

if __name__ == "__main__":
    print fibonacci(200)
