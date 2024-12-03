
import { defineConfig } from 'vitest';
import { DOMWrapper } from '@testing-library/dom';

defineConfig((wrapper: DOMWrapper) => {
  return {
    findByTestId: <T extends Element>(testId: string): DOMWrapper<T> => {
      return wrapper.find<T>(`[data-testid='${testId}']`);
    },
    findByTestIdAll: <T extends Element>(testId: string): DOMWrapper<T>[] => {
      return wrapper.findAll<T>(`[data-testid='${testId}']`);
    },
  };
});
