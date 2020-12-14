#!/usr/bin/bash

# for app in $(ls apps/); do
#     mkdir -p apps/${app}/base/{charts,manifests}
#     helm pull ${app}/${app} --untar --untardir apps/${app}/base/charts
# done
add_repos() {
    helm repo add oteemocharts https://oteemo.github.io/charts
    helm repo add center https://repo.chartcenter.io
    helm repo add gitlab https://charts.gitlab.io
    helm repo add jenkins https://charts.jenkins.io
}

declare apps="jenkins/jenkins
              center/jfrog/artifactory-oss
              center/codecentric/keycloak
              oteemocharts/sonarqube
              center/sonatype/nexus-repository-manager"
            #   oteemocharts/sonatype-nexus"

for app in ${apps}
do
    declare app_repo=`dirname ${app}`
    declare app_name=`basename ${app}`
    declare dir_path="apps/${app_name}/base/charts"
    
    rm -rf ${dir_path}/${app_name}
    helm pull ${app_repo}/${app_name} --untar --untardir ${dir_path}
done
