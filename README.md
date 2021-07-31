# Vagrant VMs

- Vagrant: [https://www.vagrantup.com/](https://www.vagrantup.com/)
- Source: [https://github.com/thecyberbaby/Vagrant](https://github.com/thecyberbaby/Vagrant)

## Foreward

This documentation is meant for a rough, quick reference of all the parts needed to get up and running with
CentOS-7 within [vagrant](https://www.vagrantup.com/) environment.
This guide is intended to provide a starting point, and give some additional insight or considerations that may not be readily apparent about the whole process.

### Introduction Vagrant

Vagrant is a tool for building and distributing development environments.

Development environments managed by Vagrant can run on local virtualized
platforms such as VirtualBox or VMware, in the cloud via AWS or OpenStack,
or in containers such as with Docker or raw LXC`. `
Vagrant provides the framework and configuration format to create and
manage complete portable development environments. These development
environments can live on your computer or in the cloud, and are portable
between Windows, Mac OS X, and Linux.

### Quick Start

Package dependencies: Vagrant requires `bsdtar` and `curl` to be available on
your system PATH to run successfully.

For the quick-start, we'll bring up a development machine on
[VirtualBox](https://www.virtualbox.org/) because it is free and works
on all major platforms. Vagrant can, however, work with almost any
system such as [OpenStack](https://www.openstack.org/), [VMware](https://www.vmware.com/), [Docker](https://docs.docker.com/), etc.

First, make sure your development machine has
[VirtualBox](https://www.virtualbox.org/)
installed. After this,
[download and install the appropriate Vagrant package for your OS](https://www.vagrantup.com/downloads.html).

To build your first virtual environment:

    vagrant init centos/7
    vagrant up

Note: The above `vagrant up` command will also trigger Vagrant to download the
`centos/7` box via the specified URL. Vagrant only does this if it detects that
the box doesn't already exist on your system.

### Getting Started Guide

To learn how to build a fully functional development environment, follow the
[getting started guide](https://www.vagrantup.com/docs/getting-started).
