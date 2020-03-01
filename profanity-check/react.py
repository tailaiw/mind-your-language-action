"React to profanity"

import sys


def reply(author):
    """
    Return response to the offensive comment
    """

    return "@{} please mind your language.".format(author)


if __name__ == "__main__":

    author = sys.argv[1]

    print(reply(author))
