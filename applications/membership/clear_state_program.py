from pyteal import *

"""
Membership Application - clear state program
"""


def main():
    program = Seq([Approve()])

    return compileTeal(program, mode=Mode.Application, version=8)


if __name__ == "__main__":
    print(main())
