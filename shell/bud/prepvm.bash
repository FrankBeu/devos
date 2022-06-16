source shellColorDefinitions

PREPARE_VM_SCRIPT_PATH="${FLAKEROOT}/shell/bud/prepvm/${1:l}"

### PRINT COMMAND TO EVAL OR PRINT ERROR MESSAGE
if [[ -f ${PREPARE_VM_SCRIPT_PATH} ]]
  then echo "source $PREPARE_VM_SCRIPT_PATH"
  else echo -e "\n  setupscript ${MR}${PREPARE_VM_SCRIPT_PATH%/*}/${YR}${PREPARE_VM_SCRIPT_PATH##/*/}${NE} does ${RB}not${NE} exist yet\n" && exit 1
fi
