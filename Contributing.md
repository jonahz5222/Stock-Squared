# Contributing
## Commits
Simply fork our repository and start doing stuff! To contribute to the main project submit a pull request with details on what you changed and how it benefits the project!
## Building and Testing
We use standard XCode functionality for building and testing
## Issues
Our issues are for both bugs and suggested features, just label it as such.

### <a name="creating-a-pr"> Creating a Pull Request </a>

**1**. _**Fork**_ the repository

**2**. Clone the _original repository_ to your local PC using one of the following commands based on the protocol you are using:
 * HTTPS:`git clone https://github.com/redox-os/redox.git --origin upstream --recursive`
 * SSH:`git clone git@github.com:redox-os/redox.git --origin upstream --recursive`
 * Then rebase: `git rebase upstream master`
 If you use HTTPS, you will have to log in each time when pushing to your fork. (Recommended: learn about git SSH support, it logs in automatically using SSH keys)
 
**3**. **Add** your fork with
 * HTTPS:`git remote add origin https://github.com/your-username/Stock-Squared.git`
 * SSH:`git remote add origin git@github.com:your-username/Stock-Squared.git`
 
**4**. Alternatively, if you already have a fork and copy of the repo, you can simply check to **make sure you're up-to-date**
 * Pull the upstream:`git pull upstream --rebase`
 * Update the submodules:`git submodule update --recursive --init`
 
**5**. Create a _**separate branch**_ (recommended if you're making multiple changes simultaneously) (`git checkout -b my-branch`)

**6**. _Make changes_

**7**. **Commit** (`git add <item(s) you changed>; git commit`) and write your commit message

**8**. Test your changes by **cleaning** (`make clean; git clean -Xfd`) and **building** with `make qemu` (you might have to use `make qemu kvm=no`) or `make virtualbox`.
(see [Best Practices and Guidelines](#best-practices))

**9**. _**Pull**_ from upstream (`git pull upstream --rebase`) (Note: Make sure to include `--rebase`, as it will apply your changes on top of the changes you just pulled, allowing for a much cleaner merge)

**10**. Repeat step **9** to make sure the rebase still builds and starts

**11**. Push to **your fork** (`git push origin <branch>`), `<branch>` being the branch you created earlier

**12**. Create a _pull request_

**13**. If your changes are _minor_, you can just describe them in a paragraph or less. If they're _major_, please fill out the provided form.

**14. Submit!**
