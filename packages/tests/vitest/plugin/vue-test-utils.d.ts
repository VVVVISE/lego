import { DOMWrapper } from "@vue/test-utils";

declare module "@vue/test-utils" {
  export class VueWrapper {
    findByTestId<T extends Element>(testId: string): DOMWrapper<T>;
    findByTestIdAll<T extends Element>(testId: string): DOMWrapper<T>[];
  }
}
