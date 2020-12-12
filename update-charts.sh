#!/usr/bin/bash

# for app in $(ls apps/); do
#     mkdir -p apps/${app}/base/{charts,manifests}
#     helm pull ${app}/${app} --untar --untardir apps/${app}/base/charts
# done

apps="jenkins/jenkins"

for app in ${apps}
do
    app_repo=`dirname ${app}`
    app_name=`basename ${app}`
    dir_path="apps/${app_name}/base/charts"

    helm pull ${app_repo}/${app_name} --untar --untardir ${dir_path}
done
