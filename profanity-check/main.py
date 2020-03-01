import sys
import json

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

    payload_json_path = sys.argv[1]
    with open(payload_json_path, "r") as f:
        payload = json.load(f)

    comment = payload["comment"]["body"]

    print(check_profanity(comment))

