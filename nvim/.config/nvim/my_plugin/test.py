import os


def my_test_function(HELLO=1, GOODBYE="GOODBYE"):
    """
    docstring with some help
    """
    print(f"{hello} and {goodbye}")

    print(type(hello), type(goodbye))


def another_function():
    os.path.exists(os.path.join("$HOME"))
