import sys

from profanity_check import predict, predict_prob

TRIGGER_WORD_FOR_TEST = "thisisatriggerword"


def check_profanity(comment):
    """
    Check if the comment is offensive
    """

    if TRIGGER_WORD_FOR_TEST in comment:
        return 1

    return predict([comment])[0]


if __name__ == "__main__":

    if len(sys.argv) != 2:
        raise RuntimeError("Wrong number of input.")

    comment = sys.argv[1]

    print(check_profanity(comment))

