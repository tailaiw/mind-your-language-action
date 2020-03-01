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

## Workflow

Whenever a comment to an issue or pull request is created, the work flow will perform [profanity check](#profanity-check) against the comment text and take [reaction](#reaction) if offensive language is found.

### Profanity Check

I am currently using [profanity-check](https://github.com/vzhou842/profanity-check), a Python package of profanity detection based on machine learning, to determine whether a comment is offensive or not. It is not super powerful but is sensitive to obvious offensive language. I hope I may use some cutting-edge NLP algorithms to get better performance. I will create a separate repo to pursue better alternatives soon. If you are interested in it, stay tuned.

### Reaction

The reaction right now is an auto-reply by github-actions bot that mentions the sender of offensive comment.

### Contributing

I'm a new developer of github action, so suggestion and help are more than welcome. Of course, "Mind your language" :smile: