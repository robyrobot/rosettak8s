# rosettak8s

RosettaK8s is a very simple workaround to run amd64 on Kubernetes nodes based on arm processor; for example the AWS Nitro based instances.
The daemonset deployed exploit *tonistiigi/binfmt* docker image to install binfmt abstraction layer (http://binfmt-support.nongnu.org/) on nodes allowing the cluster to run different architecture compiled images.

## Installation
To install all the emulators supported by *tonistiigi/binfmt* image run the following command:
```
curl -s https://raw.githubusercontent.com/robyrobot/rosettak8s/main/install.sh | sh | kubectl apply -f -
```
To install only a limited set of emulator, use the environment variable ARCH_LIST. For example to install only "amd64" emulator use this command:
```
curl -s https://raw.githubusercontent.com/robyrobot/rosettak8s/main/install.sh | ARCH_LIST=amd64 sh | kubectl -f -
```

## Uninstall
To uninstall rosettak8s use the uninstall.sh builder script, with ARCH_LIST environment variable to uninstall only some emulators.
```
curl -s https://raw.githubusercontent.com/robyrobot/rosettak8s/main/uninstall.sh | sh | kubectl apply -f -
```
