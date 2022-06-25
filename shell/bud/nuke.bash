shopt -s globstar

rm -r ${FLAKEROOT}/result
rm    ${FLAKEROOT}/*.qcow2
rm -r ${FLAKEROOT}/**/__pycache__/
