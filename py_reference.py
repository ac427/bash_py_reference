#!/usr/bin/python
import re

#fine all JobID= to end of line from file logs/slurmctld 
f = open('logs/slurmctld', 'r')
strings = re.findall(r'JobID=.*\n', f.read())
for foo in strings:
	print foo

# file all ENCODED: * \n 

f = open('logs/slurmctld', 'r')
strings = re.findall(r'ENCODED.*\n', f.read())
for foo in strings:
	print foo

######### STRINGS #########
foo='hello world 1234'
bar='1234'
qux='hello'

print len(foo)
print foo.lower();
print foo.upper()

print foo.startswith('hello')
print foo.endswith('world')
foo.replace('world', 'planet') 
#returns a list of substring
stringlist= foo.split(' ')  
foo.join(stringlist) 
"""
>>> print foo.join(stringlist)
hello world 1234
>>> print stringlist
['hello', 'world', '1234']
>>> foo=' '
>>> print foo.join(stringlist)
hello world 1234
>>> foo='123'
>>> print foo.join(stringlist)
hello123world1231234
"""


