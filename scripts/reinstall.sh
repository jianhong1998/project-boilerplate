echo "Rmoving 'backend' node_modules..."
cd backend
rm -rf node_modules
pnpm install --frozen-lockfile

echo "Rmoving 'api-test' node_modules..."
cd ../api-test
rm -rf node_modules
pnpm install --frozen-lockfile

echo "Rmoving 'frontend' node_modules..."
cd ../frontend
rm -rf node_modules
pnpm install --frozen-lockfile