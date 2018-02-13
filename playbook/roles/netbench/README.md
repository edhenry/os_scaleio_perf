# iperf benchmark playbook

## Requirements

* [Ansible](http://docs.ansible.com/ansible/latest/intro.html)
* IP connectivity between hosts
* SSH access to nodes from host that will be running ansible

## Overview

This playbook, and subsquent role can be used to perform iperf benchmark testing on a given set of hosts.

All communications patterns are supported :

* many-to-many
* one-to-many
* many-to-one
* one-to-one

This is dependent on which nodes you assigned to which `[host groups]` defined in the `hosts` file.

### Host definition

The play currently supports the ability to use a "jump host" (bastion host) in order to execute these tests
against a deployment. The `ssh_ips` group that is defined within the hosts file is where this can be defined.
If no jump host is required, feel free to let the management of the jobs run in-line with the tests themselves.
Though it is advised to utilize a management network of sorts as to not impact the execution of the playbook.

Within the `hosts` file in this directory there are two groups defined, `iperf_servers` and `iperf_clients`, the 
naming of these groups is meant to stay in line with the typical iperf nomenclature.

Define which hosts you would like to run iperf in server mode `-s`, along with which hosts you would like to run client
connectivity tests.

### Play variables

#### `test_count`

There is currently only a single variable for definition within this role. This variable is located in the `var/` subdirectory.

The variable `test_count` will control how many concurrent sessions you would like to run between nodes. This variable will help
when utilizing LAG (bond) interfaces when testing connectivity between multiple hosts within a network.

Each one of the tests will end up utilizing a different destination port, which can be useful depending on
the hashing algorithm that is in use on a given LAG (bond) on the hosts one is testing.

#### `length_of_benchmark`

The length of time for which you would like the benchmark to run.

This variable is also used to pause the execution of the playbook until the
`iperf` benchmark is completed.

### Test Logs

When running these benchmarks, all output from the `iperf -s` (iperf server) and all of the output from the
clients executing the script will be collected and stored at the `benchmark_results` directory relative to the playbook directory.

The current timestamps of when the filed were `retrieved` from the host are what are appended to the filename
and do not reflect the run-time of the tests themselves. Though it is assumed that you will be executing these 
tests independent of eachother, utilizing this playbook, so the timestamps are useful for indexing when the tests
occured relative to one another.