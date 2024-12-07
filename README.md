# lego

This design paradigm leverages Next.js, Prisma, and GraphQL to automate model and interface generation while centralizing communication between clients and the edge. It simplifies software development, ensures unified error management across packages, reduces development time, and optimizes resource usage for efficient and streamlined operations.

This Product is **ProtoTypes** of [VVVVISE/LEGOJS](https://github.com/VVVVISE/legojs).

## Status
### NOW UNDER WIP - alpha or less. 

## TABLE of CONTENTS

- [SetUp](https://github.com/VVVVISE/lego?tab=readme-ov-file#SetUp)
- [CoreMiddleWares](https://github.com/VVVVISE/lego?tab=readme-ov-file#coremiddlewares)
- [Cloud](https://github.com/VVVVISE/lego?tab=readme-ov-file#Cloud)
- [DB](https://github.com/VVVVISE/lego?tab=readme-ov-file#DB)
- [Schemes](https://github.com/VVVVISE/lego?tab=readme-ov-file#Schemes)
- [Apps](https://github.com/VVVVISE/lego?tab=readme-ov-file#Apps)
- [Serverless](https://github.com/VVVVISE/lego?tab=readme-ov-file#Serverless)
- [Packages](https://github.com/VVVVISE/lego?tab=readme-ov-file#Packages)
- [Serverless](https://github.com/VVVVISE/lego?tab=readme-ov-file#Serverless)
- [WorkspacesDirective](https://github.com/VVVVISE/lego?tab=readme-ov-file#WorkspacesDirective)

## SetUp

### FIRST TIME INSTALL

```sh
# Install Doppler-CLI

## Debian 11+ / Ubuntu 22.04+
$ bash
$ make doppler-apt

## MacOS
$ make doppler-mac

# Create Development-Workspace
$ make create
```

### Boot whole packages dev-server

```sh
$ yarn dev

## Ref: if only boot `@repo/web` dev-server 
$ yarn web dev

```

### Build whole packages

```sh
$ yarn build

## Ref: if only build `@repo/web` package
$ yarn web dev
```

## 1. Tech

### CoreMiddleWares:

- [Turborepo (inclued Nextjs, React)](https://turbo.build/repo/docs)
- [nodejs@23.3.0: API Documentation](https://nodejs.org/docs/latest/api/)
- [Berry (yarn@4.4.1)](https://github.com/yarnpkg/berry)
  - I like PNPM, but it wears on me at times.

### Cloud:

- Environments-Handler
  - [Doppler](https://www.doppler.com/)
- Hosting
  - Asia-Pacific recommended (considering the weak JPYen)
    - [DigitalOcean](https://www.digitalocean.com/)
    - [SakuraInternet-Cloud](https://cloud.sakura.ad.jp/)
    - [SakuraInternet-VPS](https://vps.sakura.ad.jp/)
  - The following is also possible, of course
    - Vercel
    - AWS
    - GCP
    - Azure
- Serverless-Middleware
  - [AppWrite](https://github.com/appwrite/appwrite)
  - ([SupaBase](https://github.com/supabase/supabase) is also under consideration)
- ClientLogService
  - [Sentry](https://sentry.io/)

### DB:

- Prisma (ORM)
- SQLite (node@22.7.0 native-API)
  - ClientSide
- MySQL, MongoDB
  - ClstgSide

### Schemes:

- GraphQL

### Apps:

1. lego-api-clients
    - ApiClients generates **Interfaces**, **Modules**, **Functions**, and **Hooks** from **GraphQL**.
2. lego-web
    - Web application itself
    - Components
      - [lego-components-free](https://github.com/VVVVISE/lego-components-free): WIP
      - **OOUI (lego-components-pro)**: Not for public
3. lego-scheme-editor
    - The package will be able to manipulate Prisma's DB schema from the GUI, but currently it is simply Prisma.

#### clstg-apps:

1. lego-clstg-edge: _submodules_
2. lego-clstg-cli: _submodules_
3. lego-clstg-api: _submodules_
4. lego-clstg-sockets: _submodules_
5. lego-clstg-db: _submodules_

### Packages:

1. lego-cli
2. lego-assets
3. lego-constants
4. lego-figma-sync-server
5. lego-storybook-server
6. lego-type-script-config
7. lego-tests
8. lego-components
      - [lego-components-free](https://github.com/VVVVISE/lego-components-free): _WIP_
      - **OOUI (lego-components-pro)**: Not for public

## 2. PackagedDirectives

```shell
.
├── .changeset/
├── .github/
├── .husky/
├── .storybook/
├── .vscode/
├── .yarn/
├── apps
│   ├── api-client/
│   │   ├── dist/
│   │   ├── main.ts
│   │   ├── codegen.ts
│   │   ├── package.json
│   │   └── tsconfig.json
│   ├── prisma-app/
│   │   ├── prisma/
│   │   │   └── scheme.prisma
│   │   ├── dotenv.clstg
│   │   ├── dotenv.dev
│   │   ├── package.json
│   │   └── tsconfig.json
│   └── web/
│       ├── node_modules/
│       ├── public/
│       ├── dotenv.clstg
│       ├── dotenv.dev
│       ├── next.config.ts
│       ├── package.json
│       └── tsconfig.json
├── docs
│   ├── exsamples
│   ├── references
│   ├── sdks
│   ├── services
│   ├── specs
│   └── tutorials
├── packages/
│   ├── styles/
│   ├── tests/
│   │   ├── node_modules/
│   │   ├── playwright/
│   │   ├── vitest/
│   │   └── package.json
│   ├── typescript-config
│   │   ├── base.json
│   │   ├── nextjs.json
│   │   ├── package.json
│   │   └── react-liblary.json
│   └── ui
│       ├── node_modules/
│       ├── components/
│       ├── package.json
│       └── tsconfig.json
├── node_modules
│   └── @repo
│       ├── lego-api-client
│       ├── lego-web
│       ├── lego-assets
│       ├── lego-cli
│       ├── lego-constants
│       ├── lego-scheme-editor
│       ├── lego-storybook-server
│       ├── lego-tests
│       ├── lego-typescript-config
│       ├── lego-ooui # submodules
│       └── lego-clstg-* # submodules
├── app.clstg.yaml
├── app.dev.yaml
├── app.storybook.yaml
├── LISENCE
├── Makefile
├── package.json
├── README.md
├── turbo.json
└── yarn.lock
```

## 3. License

GPL-3.0 license
