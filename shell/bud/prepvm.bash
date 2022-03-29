PREPARE_VM_SCRIPT_PATH="./shell/bud/prepvm/${1:l}"
if [[ -f ./$PREPARE_VM_SCRIPT_PATH ]]
  then echo "source $PREPARE_VM_SCRIPT_PATH"
  else echo "setupscript $PREPARE_VM_SCRIPT_PATH does not exist yet"
fi
