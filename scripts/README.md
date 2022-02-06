# About

This section contains two scripts one written using Python and the other written using a bash script leveraging awk and sed. Both scripts are written to solve the problem sourced on [hacker rank here](https://www.hackerrank.com/challenges/paste-3/problem)

The objective of the scripts written here is to parse a csv and fine all lines that have N characters and print the result as a tab separated list.

## Pre-requisites

The scripts here should only require a bash shell and python3 installed.

## Running the scripts

Both the bash script and the python script perform their functions on the csv file included in this directory called:

```sh
file.csv
```

This file is a csv containing names of cities accompanied by their corresponding state abbreviation. 

Each of the below examples assumes you run the script from the 'scripts' directory or in the same directory as this readme.

### Bash Script

```sh
./kiddies/solution.sh $(pwd)/file.csv 15 # 15 is the number of characters we will be searching for it can be any positive integer
```

Assuming you run the script above your output should look something like the following:

```sh
Albuquerque, N.M.	Anchorage, Alaska	Atlantic City, N.J.	Baton Rouge, La.	Birmingham, Ala.	Bridgeport, Conn.
```

### Python Script

```sh
python grown-ups/solution.py $(pwd)/file.csv 15
```

Assuming you run the script above your output should look something like the following:

```sh
Albuquerque, N.M.	Anchorage, Alaska	Atlantic City, N.J.	Baton Rouge, La.	Birmingham, Ala.	Bridgeport, Conn.
```