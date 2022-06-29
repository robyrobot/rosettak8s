#!/bin/sh

ARCH_LIST="${ARCH_LIST:-'*'}"
cat <<EOF
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: rosettak8s-installation
  labels:
    app: rosettak8s-installation
spec:
  selector:
    matchLabels:
      app: rosettak8s-installation
  template:
    metadata:
      labels:
        app: rosettak8s-installation
    spec:
      initContainers:
      - name: rosettak8s-installation
        args:
          - --uninstall
          - ${ARCH_LIST}
        image: tonistiigi/binfmt
        securityContext:
          privileged: true
      containers:
      - name: sleep
        image: k8s.gcr.io/pause:3.1
  updateStrategy:
    type: RollingUpdate

EOF