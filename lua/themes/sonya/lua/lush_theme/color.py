# Это однострочный комментарий

"""
Это многострочный комментарий.
Он может занимать несколько строк.
"""

# Импорт модулей
import os
import sys
from math import sqrt, pi
from typing import List, Dict, Optional, Tuple, Union, Callable

# Константы
PI = 3.14159
MAX_USERS = 100

# Переменные
name: str = "Alice"
age: int = 30
is_active: bool = True
scores: List[int] = [95, 87, 91]
person: Dict[str, Union[str, int]] = {"name": "Alice", "age": 30}

# Встроенные функции
print("Hello, World!")  # Вывод в консоль
length = len("Python")  # Длина строки
number = int("42")  # Преобразование строки в число
floating = float("3.14")  # Преобразование строки в число с плавающей точкой
text = str(42)  # Преобразование числа в строку
maximum = max(1, 2, 3)  # Максимальное значение
minimum = min(1, 2, 3)  # Минимальное значение
total = sum([1, 2, 3])  # Сумма элементов списка
rounded = round(3.14159, 2)  # Округление числа


# Функция с аннотацией типов
def greet(user: str) -> str:
    """Функция приветствия."""
    return f"Hello, {user}!"


# Класс
class Person:
    """Класс, представляющий человека."""

    def __init__(self, name: str, age: int):
        self.name = name
        self.age = age

    def introduce(self) -> str:
        """Метод для представления."""
        return f"My name is {self.name} and I am {self.age} years old."


# Наследование
class Student(Person):
    """Класс, представляющий студента."""

    def __init__(self, name: str, age: int, student_id: str):
        super().__init__(name, age)
        self.student_id = student_id

    def study(self, subject: str) -> str:
        """Метод для изучения предмета."""
        return f"{self.name} is studying {subject}."


# Условные операторы
if age > 18:
    print("You are an adult.")
elif age == 18:
    print("You just became an adult.")
else:
    print("You are a minor.")

# Циклы
for i in range(5):
    print(f"Loop iteration {i}")

while age < 100:
    age += 1
    print(f"Age is now {age}")

# Обработка исключений
try:
    result = 10 / 0
except ZeroDivisionError as e:
    print(f"Error: {e}")
finally:
    print("This will always execute.")


# Генераторы
def fibonacci(n: int):
    """Генератор чисел Фибоначчи."""
    a, b = 0, 1
    for _ in range(n):
        yield a
        a, b = b, a + b


# Использование генератора
for num in fibonacci(10):
    print(num)


# Декораторы
def log_function(func: Callable) -> Callable:
    """Декоратор для логирования вызовов функций."""

    def wrapper(*args, **kwargs):
        print(f"Calling function {func.__name__} with args: {args}, kwargs: {kwargs}")
        return func(*args, **kwargs)

    return wrapper


@log_function
def add(a: int, b: int) -> int:
    """Функция сложения."""
    return a + b


# Лямбда-функции
square = lambda x: x**2
print(f"Square of 5 is {square(5)}")

# Списковые включения (list comprehensions)
squares = [x**2 for x in range(10)]
print(f"Squares: {squares}")

# Множества
unique_numbers = {1, 2, 3, 3, 4}
print(f"Unique numbers: {unique_numbers}")

# Словари
user_data: Dict[str, Optional[str]] = {"name": "Alice", "email": None, "age": "30"}

# Кортежи
coordinates: Tuple[int, int] = (10, 20)

# Работа с файлами
with open("example.txt", "w") as file:
    file.write("Hello, World!")

# Асинхронные функции
import asyncio


async def fetch_data():
    """Асинхронная функция для получения данных."""
    await asyncio.sleep(1)
    return "Data fetched"


async def main():
    data = await fetch_data()
    print(data)


# Запуск асинхронного кода
asyncio.run(main())

# Использование f-строк
print(f"Name: {name}, Age: {age}")

# Модуль os
print(f"Current working directory: {os.getcwd()}")

# Модуль math
print(f"Square root of 16 is {sqrt(16)}")
print(f"Value of pi is {pi}")

# Встроенные типы данных
numbers = [1, 2, 3, 4, 5]
text = "Python"
mapping = {"key": "value"}

# Встроенные методы
text.upper()  # Преобразование строки в верхний регистр
text.lower()  # Преобразование строки в нижний регистр
numbers.append(6)  # Добавление элемента в список
mapping.get("key")  # Получение значения по ключу

# Встроенные атрибуты
print(__name__)  # Имя текущего модуля
print(sys.version)  # Версия Python

# Встроенные исключения
try:
    raise ValueError("Invalid value")
except ValueError as e:
    print(f"Caught exception: {e}")

# Встроенные константы
print(True, False, None)  # Логические значения и None

# Встроенные функции для работы с коллекциями
filtered = filter(lambda x: x > 2, [1, 2, 3, 4])
mapped = map(lambda x: x * 2, [1, 2, 3, 4])
sorted_numbers = sorted([3, 1, 2])

# Встроенные функции для работы с числами
absolute = abs(-10)
power = pow(2, 3)
binary = bin(42)
hexadecimal = hex(255)

# Встроенные функции для работы с объектами
instance = Person("Alice", 30)
print(isinstance(instance, Person))  # Проверка типа объекта
print(hasattr(instance, "name"))  # Проверка наличия атрибута

# Встроенные функции для работы с модулями
print(dir(os))  # Список атрибутов модуля
print(help(os))  # Справка по модулю

# Встроенные функции для работы с файлами
print(open("example.txt").read())  # Чтение файла

# Встроенные функции для работы с вводом/выводом
input("Enter your name: ")  # Ввод данных
print("Hello, World!")  # Вывод данных
