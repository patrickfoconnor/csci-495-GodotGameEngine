# csci-495-GodotGameEngine
A repo for sharing notes, tips, and projects with Dr. Paxton of the Gianforte School of Computer @ Montana State University

## Documentation

General documentation for future developers can [be found here]()

Brick Breaker documentation for future developers can [be found here]()

### Repository Structure

```
csci-495-GodotGameEngine
│   README.md
│
└───ProjectSourceCode
│   │   
│   └───AvoidTheCreeper
│   │   
│   └───BrickBreaker
│      
└───Documentation
    │   
    └───GeneralDocumentation
    │   
    └───BrickBreakerDocumentation
```

### Cloning

The project can simply be cloned with `git clone git@github.com:patrickfoconnor/csci-495-GodotGameEngine.git`

### Branching

Always develop on a branch besides main. The ideal formatting for a branch name is `initals_changedescription`. For example if John Deer is doing some refactors, his branch would be something like `jd_refactors`. However, as long as the branch name is descriptive of what is being changed, it's all good. A new branch can be created and switched to with `git checkout -b "branch name"`

### Adding and committing during development

During development it's best commit early and often. Commits should have descriptive messages. It's also best to have a small number of changes in each commit. The flow for adding changes and committing is:

- `git add .` to add all files or `git add file_or_directory` to add specific files/folders
- `git commit -m "message"` to commit changes

### Pushing new changes

Once you're ready to push changes, make sure you push your development branch using `git push origin "branch_name"`.

After pushing changes you're ready to open a pull request.

- Go to the pull requests tab
- Select "New Pull Request"
- Select "main" as the base branch and the branch you pushed as the compare branch
- Follow the format of [this template]() to begin describing the changes in your pull request
- Open your request and wait for it to be merged!


## Issues

Any development issues or bugs should be tracked through the [repository issue page]()
