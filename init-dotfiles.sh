echo Targeting Directory $1
for filename in * 
do
    if [ $filename != $0 ]; then
    echo $filename ...
    echo Linking $PWD/$filename to $1
    ln -s $PWD/$filename $1
    fi
done
