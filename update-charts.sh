#!/usr/bin/bash

for app in $(ls apps/); do
    mkdir -p apps/${app}/base/{charts,manifests}
    helm pull ${app}/${app} --untar --untardir apps/${app}/base/charts
done
