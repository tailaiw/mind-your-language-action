"React to profanity"

import sys
import json


def reply(author):
    """
    Return response to the offensive comment
    """

    return "@{} please mind your language."


if __name__ == "__main__":

    payload_json_path = sys.argv[1]
    with open(payload_json_path, "r") as f:
        payload = json.load(f)

    author = payload["comment"]["user"]["login"]

    print(reply(author))
