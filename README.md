# packer-flare
Packer templates to build your FLARE VM from scratch

## Requirements

- Download `Packer` from [packer.io](https://www.packer.io/)


## Build

### Tweak config.json

Open the `config.json` and set the variables (`cpus`, `memory_size`, ...) to your need

~~~JSON
{
    "headless": "true",
    "cpus": "2",
    "memory_size": "4096",
    "disk_size": "61440"
}
~~~

### Start the build

Select a hypervisor in the following list:

- `qemu`
- `virtualbox-iso`

Select the desired operating system template:

- `windows_7.json`
- `windows_10.json`

And start the build:

    ./packer build --var-file config.json --only virtualbox-iso windows_10.json
