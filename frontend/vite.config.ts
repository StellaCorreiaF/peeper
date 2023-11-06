import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';

export default defineConfig({
  plugins: [vue()],
  build: {
    rollupOptions: {
      input: {
        // Substitua 'src/main.ts' pelo caminho do seu ponto de entrada real.
        main: 'src/main.ts',
      },
    },
  },
});
