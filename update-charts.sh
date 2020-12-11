#!/usr/bin/bash

for app in $(ls apps/); do
    helm pull ${app} --untar --untardir apps/${app}/base
done
