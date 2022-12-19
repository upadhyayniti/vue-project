# vue-project

This template should help get you started developing with Vue 3 in Vite.

## Recommended IDE Setup

[VSCode](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur) + [TypeScript Vue Plugin (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.vscode-typescript-vue-plugin).

## Customize configuration

See [Vite Configuration Reference](https://vitejs.dev/config/).

## Project Setup

First setup backend that has entries. Long term goal is to not use backend service but call API from couchbase.

Use +Add in Developer perspective and use "Import from Git". 

Provide git repo https://github.com/upadhyayniti/vue-project and branch ocp.

Add Build configurations ENV varilable of APP_TO_RUN with value of 'backend'

Add label app=backend

```sh
npm install
```

### Compile and Hot-Reload for Development

```sh
npm run dev
```

### Compile and Minify for Production

```sh
npm run build
```

### Setting pipeline

Install Red Hat OpenShift Pipelines on OpenShift using defaults

```sh
oc new-project vue
oc apply -f pipeline/00_pipeline_storage.yaml
oc apply -f pipeline/01_apply_manifest_task.yaml 
oc apply -f pipeline/02_updated_deployment_task.yaml 
oc apply -f pipeline/03_pipeline.yaml

tkn pipeline start vue-pipeline  -w name=shared-workspace,claimName=source-pvc -p NAME=vue-project -p CODE=https://github.com/upadhyayniti/vue-project.git     -p IMAGE=image-registry.openshift-image-registry.svc:5000/vue/vue-project:latest     --use-param-defaults
```



