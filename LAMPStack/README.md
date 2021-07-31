# Vagrant VM - LAMP STACK

- Vagrant: [https://www.vagrantup.com/](https://www.vagrantup.com/)
- VirtualBox: [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)
- Source: [https://github.com/thecyberbaby/Vagrant](https://github.com/thecyberbaby/Vagrant)

## Foreward

This documentation is meant for a rough, quick reference of all the parts needed to get up and running with
CentOS-7 within [vagrant](https://www.vagrantup.com/) environment.
The tools involved (git, Vagrant, VirtualBox, etc.) are not covered in great detail. This guide is intended to provide a starting point, and give some additional insight or considerations that may not be readily apparent about the whole process.

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

### CLI commands Vagrant

Create Vagrantfile and add the Vagrant box:

    touch Vagrantfile
    vagrant box add centos/7


Initialize the Vagrant environment -> The following command will initialize the Vagrant environment in current working Directory:

    vagrant up


if need to shutdown the VM using vagrant halt command:

    nishu@asus:~/Desktop/Vagrant$ vagrant halt
    ==> default: Attempting graceful shutdown of VM...

you can reload the :

    vagrant reload

In order to login to CentOS Guest VM run the vagrant ssh command.
Log in to the guest :

    vagrant ssh

###Customizing Vagrantfile

you can customize the confguration of the machine by customizing the vagrantfile :

    nishu@asus:~/Desktop/Vagrant$ cat Vagrantfile
    # -*- mode: ruby -*-
    # vi: set ft=ruby :

    
    Vagrant.configure("2") do |config|
 
    config.vm.box = "centos/7"

    #Mentioning the SSH Username/Password:
    # config.ssh.username="vagrant"
    # config.ssh.password="vagrant"

    #being configuring
    config.vm.define "lamp" do|lamp|

    #settingup hoostname/natwork
    lamp.vm.hostname="lamp"
     lamp.vm.network "private_network", ip: "192.168.205.10"
     lamp.vm.provision :shell, path: "vagrant.bootstrap.sh" #provisioning with script.sh
    end

    # End configuring
    end


### Provisioning with vagrant.bootstrap.sh

    The vagrant.bootstrap.sh file contains all the applications and dependencies 
    require to build `Lamp Stack`.

    `Linux - centos7`
    `Apache Server` 
    `My SQL`
    `PHP 7.1`

    `PHP MyAdmin`

Then you're good to go!
