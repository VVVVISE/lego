import path from "path";
const config = {
  stories: ["@/components/**/*.stories.ts"],
  addons: [
    "@storybook/addon-links",
    "@storybook/addon-essentials",
    "@storybook/addon-interactions",
    "@storybook/addon-coverage",
    {
      name: "@storybook/addon-docs",
      options: {
        csfPluginOptions: null,
        jsxOptions: {},
        mdxPluginOptions: {
          mdxCompileOptions: {
            remarkPlugins: [],
          },
        },
      },
    },
    {
      name: "@storybook/addon-styling",
    },
  ],
  core: {},
  framework: {
    name: "@storybook/vue3-vite",
    options: {},
  },
  docs: {
    autodocs: "tag",
  },
  features: {
    interactionsDebugger: true,
  },
  build: {
    test: {
      disabledAddons: [
        "@storybook/addon-docs",
        "@storybook/addon-essentials/docs",
      ],
    },
  },
  viteFinal: async (config) => {
    config.plugins.push(
      autoImport({
        imports: ["vue", "pinia"],
        dts: ".storybook/auto-imports.d.ts",
      }),
    );
    config.plugins.push(
      autoImportComponents({
        dirs: ["@/components"],
        /* nuxt.config.js pathPrefix:trueの時にtrueにする */
        // directoryAsNamespac: false,
        dts: ".storybook/components.d.ts",
      }),
    );
    config.resolve.alias = {
      ...config.resolve.alias,
      "/": path.resolve(__dirname, "../"),
      "@": path.resolve(__dirname, "../app"),
    };
    config.plugins.push(svgLoader());
    return {
      ...config,
      define: {
        ...config.define,
        global: "window",
      },
      build: {
        ...config.build,
        sourcemap: false,
        minify: false,
      },
    };
  },
};
export default config;
