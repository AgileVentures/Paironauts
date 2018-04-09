### Pull Requests: naming, syncing, size
Here is [how to create and submit a pull requests](https://github.com/AgileVentures/WebsiteOne/blob/develop/docs/how_to_submit_a_pull_request_on_github.md).

Every pull request should refer to a corresponding GitHub issue, and when you create feature/bug-fix branches please include the id of the relevant issue, e.g.

```
git checkout -b 799_add_contributing_md
```

Please ensure that each commit in your pull request makes a single coherent change and that the overall pull request only includes commits related to the specific GitHub issue that the pull request is addressing.  This helps the project managers understand the PRs and merge them more quickly.

Whatever you are working on, or however far you get please do open a "Work in Progress" (WIP) [pull request](https://help.github.com/articles/creating-a-pull-request/) (just prepend your PR title with "[WIP]" ) so that others in the team can comment on your approach.  Even if you hate your horrible code :-) please throw it up there and we'll help guide your code to fit in with the rest of the project.

Before you make a pull request it is a great idea to sync again to the upstream develop branch to reduce the chance that there will be any merge conflicts arising from other PRs that have been merged to develop since you started work:

```
git pull upstream develop
```

In your pull request description please include a sensible description of your code and a tag `fixes #<issue-id>` e.g. :

```
This PR adds a CONTRIBUTING.md file and a docs directory

fixes #799
```
