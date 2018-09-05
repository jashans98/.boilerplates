# Templates
When creating new LaTeX documents or setting up vim on a new machine, you inevitably end up
wasting some time writing boilerplate text to get everything set up correctly. This is a single
command-line tool to manage all the templates you may want to keep re-using.

## Instructions
Make sure you have Python (preferably Python 3) set up on your machine

 1. Clone this repository in your home directory. You will have a new folder called `.templates`
 2. Add this directory to your **$PATH** variable in your `bash_profile` or `bashrc`
 3. Define all the templates you want in `config.json` inside this directory. For example, if you have
 a Latex template that you use repeatedly for assignments, you could create a key called `latex` pointing to a file called `assignments.tex`. Inside `assignments.tex`, place all the boilerplate Latex code that you use for your assignments.

 When you want to create a new file with this template in a different directory, you simply need to do:

 ```
 template-create latex cs341-assignment1.tex
 ```

 The first argument is the key you specified in `config.json`, the second is the desitnation file name
 of the new file that you may want to set up with this template.
