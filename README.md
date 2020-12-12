# argocd-test

ArgoCD Git Repo for deploying a set of applications as a app-of-apps.

## Git Structure
```
Apps - Applications within App Suite
Bootstrap - Customization of ArgoCD
Environment/{env} - Application Suite defining root Application (Helm Chart)
```

## Application Definition

There are 2 best-practices for defining an per-environment application deployment:
* Helm Chart (`environment/prod/Chart.yaml`) -> 
  ArgoCD Application (`environment/prod/template/*.yaml`) -> 
  Helm Chart (`app/{app}/overlays/{env}/Chart.yaml`) ->
  ArgoCD Application (`app/{app}/overlays/{env}/template/{app}.yaml`) ->
  Helm Chart (`app/{app}/base/charts/{app}/Chart.yaml`)

* Helm Chart (`environment/prod/Chart.yaml`) -> 
  ArgoCD Application (`environment/prod/template/*.yaml`) -> 
  Kustomize (`app/{app}/overlays/{env}/kustomization.yaml`)->
  Manifests (`app/{app}/base/manifests/*.yaml`)

With the Helm method, you can define an ArgoCD