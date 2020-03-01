# Mind your language action

This action monitor comments to issues and pull requests, and remind the sender if offensive language is found.

## Example usage

Create the following workflow file `mind-your-language.yml` in the `.github/workflows/` directory of your repository:

```yml
name: Mind your language
on:
  issues:
    types:
      - opened
      - edited
  issue_comment:
    types:
      - created
      - edited
  pull_request_review_comment:
    types:
      - created
      - edited
jobs:
  echo_issue_comment:
    runs-on: ubuntu-latest
    name: profanity check
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Profanity check step
        uses: tailaiw/mind-your-language-action@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```