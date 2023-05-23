if [ $1 == '']; then
    echo No Target Directory Given!
    dest=$XDG_CONFIG_DIR
else 
    dest=$1
fi

echo Targeting Directory $dest
echo  
echo WARNING: This will overwrite conflicting config files in the target directory.
echo Make sure you have made a backup before doing this.
echo 

# Prompt for confirmation
read -r -p "Are you sure you wish to continue? [y/N] " input
case $input in
    # Yes
    [yY][eE][sS]|[yY])
    echo Proceeding...
    for filename in *    
    do
        if [ $filename != $0 ]; then
            echo $filename ...
            echo Linking $PWD/$filename to $dest
	    rm -rf $dest/$filename
	    ln -s $PWD/$filename $dest/$filename
        fi
    done
    ;;
    
    # No (default)
    [nN][oO]|[nN]|"")
    echo "Aborting..."
    ;;
    
    # Invalid
    *)
    echo "Invalid input. Aborting"
    exit 1
    ;;
esac
