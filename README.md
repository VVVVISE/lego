# lego

This design paradigm leverages Next.js, Prisma, and GraphQL to automate model and interface generation while centralizing communication between clients and the edge. It simplifies software development, ensures unified error management across packages, reduces development time, and optimizes resource usage for efficient and streamlined operations.

This Product is **ProtoTypes** of [VVVVISE/LEGOJS](https://github.com/VVVVISE/legojs).

## NOW UNDER WIP - alpha or less:

## 1. Tech

### CoreMiddleWares:

- [Turborepo (inclued Nextjs, React)](https://turbo.build/repo/docs)
- [nodejs@23.3.0: API Documentation](https://nodejs.org/docs/latest/api/)
- [Berry (yarn@4.4.1)](https://github.com/yarnpkg/berry)
  - I like PNPM, but it wears on me at times.

### Cloud:

- [Doppler](https://www.doppler.com/)
- DigitalOcean
- AppWrite (or Maybe SupaBase)
- Sentry

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
      - [LEGO-COMPONENTS-FREE](https://github.com/VVVVISE/lego-components-free)
      - [LEGO-COMPONENTS-PRO](https://github.com/VVVVISE/lego-components-pro)
3. lego-scheme-editor
    - The package will be able to manipulate Prisma's DB schema from the GUI, but currently it is simply Prisma.

### Packages:

1. lego-constants
2. lego-assets
3. lego-locales
4. lego-figma-sync-server
5. lego-storybook-server
6. lego-type-script-config
7. lego-tests
8. **[OOUI](https://github.com/repo/ooui)**

## 2. PackagedDirectives

```sh
├── node_modules
│   └── @vvvvise
│       ├── lego-api-client
│       ├── lego-web
│       ├── lego-assets
│       ├── lego-constants
│       ├── lego-locales
│       ├── lego-scheme-editor
│       ├── lego-storybook-server
│       ├── lego-tests
│       ├── lego-typescript-config
│       └── lego-oopui
```

## 3. License

GPL-3.0 license
