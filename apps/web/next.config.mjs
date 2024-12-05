/** @type {import('next').NextConfig} */

const nextConfig = {
  transpilePackages: ["@repo/lego-ui"],
  experimental: {
    appDir: true,
  }
};

export default nextConfig;
