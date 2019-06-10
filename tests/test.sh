#!/bin/bash

# Variables
# out2=$(mktemp)

# First run
echo "First run..."
env ANSIBLE_FORCE_COLOR=1 ansible-playbook test.yml -i inventory
rc1=$?

# Second run
# echo "Second run..."
# env ANSIBLE_FORCE_COLOR=1 ANSIBLE_STDOUT_CALLBACK=actionable ansible-playbook test.yml -i inventory | tee ${out2}
# rc2=$?

# Check if second run applied any changes
# grep -qE 'changed=[1-9]+' ${out2}
# changed=$?

# Display summary
echo "1st run:     $([ ${rc1} -eq 0 ] && echo 'OK' || echo 'FAILED')"
# echo "2nd run:     $([ ${rc2} -eq 0 ] && echo 'OK' || echo 'FAILED')"
# echo "Idempotence: $([ ${changed} -ne 0 ] && echo 'OK' || echo 'FAILED')"

# Cleanup
# rm -f ${out2}

# Both runs must be fine, with idempotency preserved.
# [ ${rc1} -eq 0 -a ${rc2} -eq 0 -a ${changed} -ne 0 ] && exit 0 || exit 1
[ ${rc1} -eq 0 ] && exit 0 || exit 1
