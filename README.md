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
