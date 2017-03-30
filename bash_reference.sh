# will print all lines starting with foo
grep ^foo logs

# will print all lines ending with bar
grep bar$ logs

# will print lines with word ' foo ' ; not foobar 
grep \\bfoo\\b logs

# print exit code
$?

## last bg job pid
$!

## read all args as array 
$@

## print size of string

[root@admin logs]# foo='what is my size'
[root@admin logs]# echo ${#foo}
15



# arrays

In order to refer to the content of an item in an array, use curly braces. This is necessary, as you can see from the following example, to bypass the shell interpretation of expansion operators. If the index number is @ or *, all members of an array are referenced.


[bob in ~] ARRAY=(one two three)

[bob in ~] echo ${ARRAY[*]}
one two three

[bob in ~] echo $ARRAY[*]
one[*]

[bob in ~] echo ${ARRAY[2]}
three

[bob in ~] ARRAY[3]=four

[bob in ~] echo ${ARRAY[*]}
one two three four

#The unset built-in is used to destroy arrays or member variables of an array:


[bob in ~] unset ARRAY[1]

[bob in ~] echo ${ARRAY[*]}
one three four

[bob in ~] unset ARRAY

[bob in ~] echo ${ARRAY[*]}

# if loops

for i in $(seq 1 100)
do
	fizz=$(echo "$i%3" | bc )
	buzz=$(echo "$i%5" | bc )
	if [ $fizz -eq 0 ] && [ $buzz -eq 0 ];
	then
	echo "$i fizz buzz"
	continue 
	elif [ $fizz -eq 0 ] ;
	then
	echo "$i fizz"
	elif [ $buzz -eq 0 ];
	then 
	echo "$i buzz"
	fi
	


done

## string comparision ; use == and != instead of -eq and -ne 

x="foo"
y="bar"
z="foo"

if [ "$x" == "$z" ];then
echo match
fi


if [ "$x" != "$y" ];then
echo not match
fi


## file manuplation 

[ac@eofe4 ~]$ cat > newfile << EOF
new file 
EOF
[ac@eofe4 ~]$ cat >> newfile << EOF
append to newfile
EOF




###redirect 

[ac@eofe4 ~]$ ls newfile nofile >> out 2>&1 
[ac@eofe4 ~]$ cat out 
ls: cannot access nofile: No such file or directory
newfile


## read user input

echo 'M|F'
# reads only 1 char 
read -n 1 foo
# prints new line after above read 
echo -e '\n name?'
read bar

echo $bar $foo


#### program args
#prints all args
echo "args passed are -->  $*"
#prints args size
echo "Total args passed are --> $#"
# saves args as array
args=$@
x=0
for foo in $args
do
  echo arg  $((x+=1)) is
  echo $foo
done

```
[ac@eofe4 ~]$ ./foo.sh one two 
args passed are -->  one two
Total args passed are --> 2
arg 1 is
one
arg 2 is
two

```
## run job in bg

sleep 1m &&

## print pid of bg jobs
jobs -l
jobs -p

## fg a pid
fg 1 # to fg first job in jobs -l output 

## case eample

echo "select one two three"
read input
case "$input" in
        one)
            echo "one selected"
            ;;
         
        two)
            echo "two selected"
            ;;
         
        three)
            echo "three"
            ;;
         
        *)
            echo $"Usage: $0 {one|two|three}"
            exit 1
 
esac
