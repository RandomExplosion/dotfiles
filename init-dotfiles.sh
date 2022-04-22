echo Targeting Directory $1
echo WARNING: This will overwrite conflicting config files in the target directory. Make sure you have made a backup before doing this.

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
            echo Linking $PWD/$filename to $1
	    rm -rf $1/$filename
	    ln -s $PWD/$filename $1/$filename
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
