# Homework (not graded)

- Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- Install [Vagrant](https://www.vagrantup.com/downloads.html)
- Install [Git](https://git-scm.com/downloads)

# Homework (not graded)

- Initialize local git repository
- Create a README.md file with a description of the project
- Create the following branches
   - master (2 commits)
   - dev from the master branch (2 commits from master + 2 additional)
   - features/dosmth (commits from dev + 1 additional)
   - hotfix/bugfix (2 commits from master + 1 additional)
- Roleplay the following scenarios:
   - Release:
- All commits (except the hotfix) must go to master
   - Hotfix release:
- Changes from hotfix/bugfix should first go to master, and then to other branches

# Homework (not graded)
- Register on [GitHub](https://github.com/)
   - Add an SSH key to GitHub
   - Create a repository on GitHub
   - Sync your local repository with your GitHub repository
- GitLab CE*
   - Install locally (VirtualBox) GitLab CE
   - Sync your local repositories with your version of GitLab

# Homework 1
### Part 1
- Create a Vagrantfile to create a VirtualBox virtual machine with Debian OS installed.
- Configure the virtual machine so that on the host machine, when accessing the address http://localhost:8080, a static HTML file **[index.html](index/index.html)** is opened, and when accessing the http address ://localhost:8081 - dynamic site **[index.php](findex/index.php)**. To run a dynamic website you need any version of PHP.
- Add the `.vagrant` directory to `.gitignore`.
- Create a `devops-hometasks` repository on GitHub. Place the resulting Vagrantfile and all the files necessary for its operation into the `task-01` directory in this repository. Send me the link to the repository.

### Part 2
- Create and publish to [Vagrant Cloud](https://vagrantcloud.com/) a Vagrant image that meets the requirements:
   - Based on centos/8
   - Includes installed apache2
   - Includes installed php
   - Includes installed mysql-server
- Rework the first homework assignment based on your image. In your repository, create a branch `feature-01`. Upload the revised 1st homework to the `task-01` directory in the `feature-01` branch.
- Also in the `task-01` directory, create a `README.md` file, in which add a link to your Vagrant image in Vagrant Cloud.

# Useful links
### Git
- [How to work with branching](https://gist.github.com/digitaljhelms/4287848)
- [Immersion in Git](http://gitimmersion.com)

### Git hosting
- [Github](https://github.com)
- [GitLab](https://gitlab.com)
- [GitLab CE](https://about.gitlab.com/install/?version=ce)
- [Bitbucket](https://bitbucket.org)
- [Installing your own Bitbucket server](https://confluence.atlassian.com/bitbucketserver/bitbucket-server-installation-guide-867338382.html)
- [Hello-world project on GitHub](https://guides.github.com/activities/hello-world/)
- [Video course on Git and GitHub](https://www.youtube.com/playlist?list=PLY4rE9dstrJyTdVJpv7FibSaXB4BHPInb)
- [More instructions on GitHub](https://habr.com/ru/post/125799/)
- [How to work with GitLab](https://losst.ru/kak-polzovatsya-gitlab)
- [Installing GitLab on Ubuntu](https://1cloud.ru/help/linux/ustanovka-gitlab-na-ubuntu)
- [Comparing ambiguous terms in GitLab, GitHub and Bitbucket](https://habr.com/ru/company/softmart/blog/308422/)

### Vagrant
- [Vagrant images](https://app.vagrantup.com/boxes/search)
- [Documentation](https://www.vagrantup.com/docs/)
- [Configuration examples](https://github.com/patrickdlee/vagrant-examples)
- [Instructions for assembling the base image](https://www.vagrantup.com/docs/boxes/base.html)
- [Packer Utility](https://www.packer.io)

# Git commands
- `git branch branch1`
- `git branch`
- `git checkout branch1`
- `git checkout -b branch2`
- `git stash`
- `git stash -u`
- `git stash list`
- `git stash show stash@{0}`
- `git stash apply stash@{1}`
- `git stash drop stash@{1}`
- `git stash clear`
- `git stash pop`
- `git log --all --graph --online`
- `git merge master`
- `git merge master --no-ff --no-commit`
- `git rm --cached file2`
- `git rebase master`
- `git branch -d branch2`
- `git tag`
- `git tag v1.1`
- `git show v1.1`
- `git tag --delete v1.1`
- `git help merge`
- `git remote add origin git@github.com:Fenikks/git_demo.git`
- `git remote -v`
- `git remote rename origin test`
- `git push -u origin master`
- `git remote show origin`
- `git clone`
- `git pull`
- `git push origin v1.0`

# Vagrant commands
- `vagrant init`
- `vagrant up`
- `vagrant provision`
- `vagrant up --provision`
- `vagrant box add <box_name> <box_path>`
- `vagrant ssh`
- `vagrant suspend`
- `vagrant halt`
- `vagrant destroy`
- `vagrant status`
- `vagrant global-status`
- `vagrant package`