#!/usr/bin/bash
# ssh:
# ssh -i platform/secrets/ssh/id_rsa_kubeadmin

# masters:
# 10.0.1.237
# 10.0.2.165
# 10.0.3.181

# workers:
# 10.0.1.161
# 10.0.2.169
# 10.0.3.91

# dexidp
# skopeo copy docker://quay.io/dexidp/dex:v2.22.0 \
#    docker://registry.griffin-sparta-test.redhat.io:5000/dexidp/dex:v2.22.0 \
#    --src-tls-verify=false --dest-tls-verify=false

podman login -u cloudctl -p cloudctl registry.griffin-sparta-test.redhat.io:5000/

podman pull --tls-verify=false registry.griffin-sparta-test.redhat.io:5000/library/redis:5.0.10-alpine
podman pull --tls-verify=false registry.griffin-sparta-test.redhat.io:5000/argoproj/argocd:v1.7.9

podman tag registry.griffin-sparta-test.redhat.io:5000/library/redis:5.0.10-alpine docker.io/library/redis:5.0.10-alpine
podman tag registry.griffin-sparta-test.redhat.io:5000/argoproj/argocd:v1.7.9 docker.io/argoproj/argocd:v1.7.9

