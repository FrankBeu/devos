LOCATION=`pwd`

source shellColorDefinitions

declare -A TYPES
TYPES[i]=i3
TYPES[d]=dotLocal

### TYPE
if [[ -n ${TYPES[${1:-argNotGiven}]} ]]
then
    TYPE_SELECTED=${TYPES[${1}]}
else
    echo -e ""
    echo -e "\tThe first argument has to be one of the following ${UB}types${NE}:"
    for TYPE in "${TYPES[@]}"; do echo -e "\t\t•${MB}${TYPE:0:1}${UB}${TYPE:1}${NE}"; done
    echo -e ""
    exit 1
fi

### INSTANTIATION
if [[ -d ${LOCATION}/${TYPE_SELECTED} ]]
then
    echo -e ""
    echo -e "\tA directory ${RB}already exists${NE} at ${YR}${LOCATION}/${TYPE_SELECTED}${NE}."
    echo -e ""
    exit 1
else
    case ${TYPE_SELECTED} in

        ${TYPES[i]} )
            ### CREATE DIRECTORY
            mkdir ${LOCATION}/${TYPES[i]} &&
            ### GET PROFILE_NAME
            PROFILE_PATH=${LOCATION%%${TYPES[i]}*}
            PATH_WITHOUT_TRAILING_SLASH=${PROFILE_PATH%/}
            PROFILE_NAME=${PATH_WITHOUT_TRAILING_SLASH##*/}
            ### CREATE config.nix
            cp -r ${FLAKEROOT}/shell/bud/templates/${TYPES[i]}/template.nix ${LOCATION}/${TYPES[i]}/additional.nix &&
            ### FILL CLIPBOARD
            cat ${FLAKEROOT}/shell/bud/templates/${TYPES[i]}/clipboard.nix | xsel -ib &&
            ### CONFIGURE config.nix
            sed -i "s/\(####################\) NAME/\1 \U${PROFILE_NAME}/" ${LOCATION}/${TYPES[i]}/additional.nix &&
            sed -i "s/NAME/${PROFILE_NAME}/g" ${LOCATION}/${TYPES[i]}/additional.nix &&
            echo -e ""
            echo -e "\tA ${UB}${TYPES[i]}${NE}-additional-template was ${GB}created${NE} for ${YR}${PROFILE_NAME}${NE}.\n" &&
            echo -e "\tInsert the snippet from the ${MR}clipboard${NE} into ${YR}./default.nix${NE}."
            ;;

        ${TYPES[d]} )
            echo -e ""
            echo -en "${MB}Enter scriptName: ${NE}"
            read SCRIPTNAME
            echo -en "${MB}Use current location?[y/N]: ${NE}"
            read USE_CURRENT_LOCATION
            if [[ ${USE_CURRENT_LOCATION} == "y" ]]
            then
                SCRIPT_PATH=${LOCATION}/${TYPES[d]}/${SCRIPTNAME} &&
                mkdir ${LOCATION}/${TYPES[d]}
            else
                SCRIPT_PATH=${FLAKEROOT}/home/profiles/dotLocal/bin/${SCRIPTNAME}
            fi

            cp -r ${FLAKEROOT}/shell/bud/templates/${TYPES[d]}/template.zsh ${SCRIPT_PATH} &&
            sed -i "s/NAME/${SCRIPTNAME}/g" ${SCRIPT_PATH} &&
            echo -e "\n\tA ${UB}${TYPES[d]}${NE}-script-template was ${GB}created:${NE} ${YR}${SCRIPT_PATH}${NE}."

            if [[ ${USE_CURRENT_LOCATION} == "y" ]]
            then
                echo -e "home.file.\".local/bin/${SCRIPTNAME}\".source = ./dotLocal/${SCRIPTNAME};" | xsel -ib &&
                echo -e "\n\tInsert the snippet from the ${MR}clipboard${NE} into ${YR}./default.nix${NE}."
            fi
            ;;
    esac
fi
