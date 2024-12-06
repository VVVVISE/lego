# lego

This design paradigm leverages Next.js, Prisma, and GraphQL to automate model and interface generation while centralizing communication between clients and the edge. It simplifies software development, ensures unified error management across packages, reduces development time, and optimizes resource usage for efficient and streamlined operations.

This Product is **ProtoTypes** of [VVVVISE/LEGOJS](https://github.com/VVVVISE/legojs).

### NOW UNDER WIP - alpha or less

---

## CoreMiddlewares:

- Turborepo
  - [vercel/turborepo](https://github.com/vercel/turborepo)
  - [Documentation](https://turbo.build/repo/docs)
  - Made by Vercel
  - Inclued Nextjs
- Node.js v3.3.0
  - [API Documentation](https://nodejs.org/docs/latest/api/)
- Yarn v4.4.1
  - [yarnpkg/berry](https://github.com/yarnpkg/berry)
 
---

## TABLE of CONTENTS

- [Usages](#Usages)

* [Clouds](#Clouds)
* [DB](#DB)
* [Schemes](#Schemes)

- [Apps](#Apps)
- [Packages](#Packages)

* [WorkspacesDirective](#WorkspacesDirective)

- [Author](#Author)
- [Licence](#Licence)

---

## Usages:

### First time Instration

```sh
# Install Doppler-CLI

## Debian 11+ / Ubuntu 22.04+
$ bash
$ make doppler-apt

## MacOS
$ bash
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

---

## Clouds:

### Environments-Handler
  - [Doppler](https://www.doppler.com/)

### Hosting Recommnendations
  - Asia-Pacific recommended (considering the weak JPYen)
    - [DigitalOcean](https://www.digitalocean.com/)
    - [SakuraInternet-Cloud](https://cloud.sakura.ad.jp/)
    - [SakuraInternet-VPS](https://vps.sakura.ad.jp/)
  - The following is also possible, of course
    - Vercel
    - AWS
    - GCP
    - Azure

### Serverless-Middleware
  - [appwrite](https://github.com/appwrite/appwrite)
    - SubmoduleRepo: _WIP_
  - [SupaBase](https://github.com/supabase/supabase) is also under consideration

### ClientLogService
  - [Sentry](https://sentry.io/)

## DB:

- ORM
  - [Prisma](https://github.com/prisma/prisma)
- ClientSide
  - [SQLite (node@22.7.0 native-API)](https://nodejs.org/docs/latest/api/sqlite.html)
- ServerSide
  - [appwrite/Databases](https://appwrite.io/docs/products/databases)

## Schemes:

- GraphQL
  - Generated from Prisma
    - Generate Models for Client
    - Generate Models for EdgeFront
    - Generate Models for ServerlessAPI
   
---

## Apps:

1. [lego-api-client](https://github.com/VVVVISE/lego/tree/main/apps/api-client)
    - ApiClients generates **Interfaces**, **Modules**, **Functions**, and **Hooks** from **GraphQL**.
2. lego-edge
    - _WIP_
    - PartialHydration with ServerComponent
    - Sockets to ServerlessAPI
3. [lego-web](https://github.com/VVVVISE/lego/tree/main/apps/web)
    - Client application itself
    - Components Suites
      - [lego-ui](https://github.com/VVVVISE/lego/tree/main/packages/ui):
        - Basic Package
      - **[OOUI](https://github.com/VVVVISE/ooui)**:
        - Payed Subscription Package
          - _**Object-Oriented Fully UI Suites** - that fully abstract the components of browser applications_
          - _The beta version is currently in the development stage_
          - Not for public
            - We have plans for a _**Payed Subscription Service**_ in the near future.
4. [lego-scheme-editor](https://github.com/VVVVISE/lego/tree/main/apps/prisma-app)
    - The package will be able to manipulate Prisma's DB schema from the GUI, but currently it is simply Prisma.

## Packages:

1. lego-cli
2. lego-assets
3. lego-constants
4. lego-figma-sync-server
5. lego-storybook-server
6. [lego-typescript-config](https://github.com/VVVVISE/lego/tree/main/packages/typescript-config)
7. [lego-tests](https://github.com/VVVVISE/lego/tree/main/packages/tests)
    - unit-test
    - component-test
    - e2e-test
8. lego-ui
      - [lego-ui](https://github.com/VVVVISE/lego-ui):
        - Basic Package
      - **[OOUI](https://github.com/VVVVISE/ooui)**:
        - Payed Subscription Package
          - _**Object-Oriented Fully UI Suites** - that fully abstract the components of browser applications_
          - _The beta version is currently in the development stage_
          - Not for public
            - We have plans for a _**Payed Subscription Service**_ in the near future.

---

## WorkspacesDirective

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

---

## Author:
VVVVISE / **Susumu Fujii**: _Usually known as suji(i)_

## License:

GPL-3.0 license
