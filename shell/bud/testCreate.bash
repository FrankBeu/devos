cd ${FLAKEROOT}

source shellColorDefinitions

declare -A TYPES
TYPES[b]=basic
TYPES[d]=bud
TYPES[g]=golden
TYPES[s]=suite
TYPES[v]=variants


### TYPE
if [[ -n ${TYPES[${1:-argNotGiven}]} ]]
then
    TYPE_SELECTED=${TYPES[${1}]}
else
    echo -e ""
    echo -e "\tThe first argument has to be one of the following ${UB}types${NE}:"
    for TYPE in "${TYPES[@]}"; do
        ### highlight shortcut-char
        if [[ ${TYPE} == "bud" ]]
        then echo -e "\t\t•${UB}${TYPE:0:2}${MB}${TYPE:2}${NE}"
        else echo -e "\t\t•${MB}${TYPE:0:1}${UB}${TYPE:1}${NE}"
        fi
    done
    echo -e ""
    exit 1
fi


### LOCATION
if [[ ${2} =~ ^tests\.(bud|home|host|nixos)(\.[[:alnum:]]+)+$ ]]  ### starting with ..., followed by a dot with alnums at least 1 time
then
    LOCATION=${2//.//} ### substitut . with / globally
else
    echo -e ""
    echo -e "\tThe second argument has to be a ${UB}location${NE} for the test."
    echo -e "\t\t e.g.: ${YR}tests.${NE}(${YR}bud${NE}|${YR}home${NE}|${YR}host${NE}|${YR}nixos${NE})[${YR}.SEGMENT${NE}[${YR}.SEGMENT${NE}]]${YR}.TESTNAME${NE}"
    echo -e ""
    exit 1
fi


### INSTANTIATION
if [[ -d ${FLAKEROOT}/${LOCATION} ]]
then
    echo -e ""
    echo -e "\tA directory ${RB}already exists${NE} at ${YR}${FLAKEROOT}/${LOCATION}${NE}."
    echo -e ""
    exit 1
else
    ### create location and testfiles
    mkdir -p ${FLAKEROOT}/${LOCATION} &&
    cp    -r ${FLAKEROOT}/shell/bud/testCreate/${TYPE_SELECTED}/* ${FLAKEROOT}/${LOCATION} &&
    ### substitute TESTNAME with testname
    if [[ -f ${FLAKEROOT}/${LOCATION}/testScript.py            ]]; then sed -i "s/<TESTNAME>/${2}/" ${FLAKEROOT}/${LOCATION}/testScript.py           ; fi &&
    if [[ -f ${FLAKEROOT}/${LOCATION}/testScript.py.nix        ]]; then sed -i "s/<TESTNAME>/${2}/" ${FLAKEROOT}/${LOCATION}/testScript.py.nix       ; fi &&
    if [[ -f ${FLAKEROOT}/${LOCATION}/testPreparation.nix      ]]; then sed -i "s/<TESTNAME>/${2}/" ${FLAKEROOT}/${LOCATION}/testPreparation.nix     ; fi && ### KEEP: host-test-composability - each golden would be overwritten
    if [[ -f ${FLAKEROOT}/${LOCATION}/shared/testScript.py.nix ]]; then sed -i "s/<TESTNAME>/${2}/" ${FLAKEROOT}/${LOCATION}/shared/testScript.py.nix; fi &&

    echo -e ""
    echo -e "\tA ${UB}${TYPE_SELECTED}${NE}-Test was ${GB}created${NE} in ${YR}${FLAKEROOT}/${LOCATION}${NE}."
    echo -e ""
fi
