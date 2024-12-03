import { defineConfig } from "@vitest/config";
import ReactCompilerOptions from "@vitejs/plugin-react-refresh";
import AutoImport from "unplugin-auto-import/vite";

export default defineConfig({
  test: {
    globals: true,
    environment: `happy-dom`,
    include: [`app/**/*.spec.ts`],
  },
  resolve: {
    alias: {
      "@": `app`,
    },
  },
  plugins: [
    ReactCompilerOptions(),
    AutoImport({
      imports: ["react", "pinia", "react-router"],
      dts: false,
      eslintrc: {
        enabled: true,
      },
    }),
    {
      name: `findByTestId`,
      config: () => ({
        test: {
          setupFiles: [`tests/vitest/plugin/findByTestId.ts`],
        },
      }),
    },
  ],
});
