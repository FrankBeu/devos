FLAKE_DIR=`pwd`

source shellColorDefinitions

declare -A TYPES
TYPES[b]=basic
TYPES[g]=golden


### TYPE
if [[ -n ${TYPES[${1:-argNotGiven}]} ]]
then
    TYPE_SELECTED=${TYPES[${1}]}
else
    echo -e ""
    echo -e "\tThe first argument has to be one of the following ${UB}types${N}:"
    for TYPE in "${TYPES[@]}"; do echo -e "\t\t•${MB}${TYPE:0:1}${UB}${TYPE:1}${N}"; done
    echo -e ""
    exit
fi


### LOCATION
if [[ ${2} =~ ^(home|host|nixos)(\.[[:alnum:]]+)+$ ]]  ### starting with ..., followed by a dot with alnums at least 1 time
then
    LOCATION=${2//.//} ### substitut . with / globally
else
    echo -e ""
    echo -e "\tThe second argument has to be a ${UB}location${N} for the test."
    echo -e "\t\t e.g.: (${Y}home${N}|${Y}host${N}|${Y}nixos${N})${Y}.SEGMENT${N}[${Y}.SEGMENT${N}]${Y}.TESTNAME${N}"
    echo -e ""
    exit
fi
echo -e ""


### INSTANTIATION
if [[ -d ${FLAKE_DIR}/tests/${LOCATION} ]]
then
    echo -e "\tA directory ${RB}already exists${N} at ${Y}${FLAKE_DIR}/tests/${LOCATION}${N}."
    echo -e ""
    exit
else
    mkdir -p ${FLAKE_DIR}/tests/${LOCATION}
    cp    -r ${FLAKE_DIR}/shell/bud/testCreate/templates/${TYPE_SELECTED}/* ${FLAKE_DIR}/tests/${LOCATION}
    sed   -i "s/<TESTNAME>/${2}/" ${FLAKE_DIR}/tests/${LOCATION}/testScript.py

    echo -e "\t A ${UB}${TYPE_SELECTED}${N}-Test was ${GB}created${N} in ${Y}${FLAKE_DIR}/tests/${LOCATION}${N}."
    echo -e ""
fi
