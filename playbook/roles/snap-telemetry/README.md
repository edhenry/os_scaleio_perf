# snap-telemetry installation and configuration role

## Requirements

* [Ansible](http://docs.ansible.com/ansible/latest/intro.html)
* IP connectivity between hosts
* SSH access to nodes from host that will be running ansible

## Overview

This role is used for the collection, installation, and configuration of the Intel SNAP telemetry framework.

The play consists of tasks that will collect the appropriate snap-telemetry binaries from a linux distribution's
respective package management system, along with the plugins that will be fetched from the respective SNAP plugin 
repositories hosted on github.

## Hosts definition

The hosts definition is entirely up to the end user of this play and they can define a new host group in the hosts
file for any and all hosts that they would like to execute this playbook against.

## Play Variables

The play variables, today, consist of the SNAP plugin version numbers that the role will utilize. In the future
these plugins and their respective versions can be made more dynamic using lists within the Ansible context. This
requirement was not captured with this work.