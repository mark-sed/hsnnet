# Haskell neural network modules
*Author:* Marek Sedláček  
*Contact:* mr.mareksedlacek@gmail.com  

This a little project to demonstrate a simple neural network made in haskell with just native libraries.  
Current configuration is setup to detect that the expected output should be the 1st value in passed in list.  

# How to compile
Compilation should be done with `Makefile` simply by executing `make` in terminal.  
To delete additional files created by the compiler use `make clean`.

# How to run
Program should be run (after compilation) simply by running `./nn` with 3 input values and possibly optional 4th argument which sets the amount of epochs used to train the neural network.  
For example: `./nn 1.0 0.0 0.0 42`

