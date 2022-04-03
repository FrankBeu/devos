RUN_TEST_INTERACTIVELY="`pwd`/result/bin/nixos-test-driver --interactive"

if [[ ${1} =~ ^(keep|k)$ ]]
then
    ${RUN_TEST_INTERACTIVELY} --keep-vm-state
else
    ${RUN_TEST_INTERACTIVELY}
fi
