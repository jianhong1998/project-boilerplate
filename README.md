# Claim Submission Application

A modern full-stack TypeScript application for handling claim submissions with a React frontend, NestJS backend, and PostgreSQL database.

## 🏗️ Architecture Overview

This application follows a microservices architecture with the following components:

- **Frontend**: Next.js 15 with React 19, TypeScript, and TailwindCSS
- **Backend**: NestJS with TypeORM and PostgreSQL
- **Database**: PostgreSQL 16
- **Testing**: Vitest for unit and integration tests
- **Infrastructure**: Docker Compose for local development

## 📁 Project Structure

```
claim-submission-app/
├── frontend/                 # Next.js React application
│   ├── src/
│   │   ├── app/             # Next.js App Router pages
│   │   │   ├── layout.tsx   # Root layout
│   │   │   ├── page.tsx     # Home page
│   │   │   └── globals.css  # Global styles
│   │   ├── components/      # Reusable UI components
│   │   │   ├── ui/          # Base UI components (buttons, inputs)
│   │   │   ├── pages/       # Page-specific components
│   │   │   └── providers/   # React providers (Query, Theme)
│   │   ├── hooks/           # Custom React hooks
│   │   │   └── queries/     # TanStack Query hooks
│   │   ├── lib/             # Utility functions and configurations
│   │   ├── types/           # TypeScript type definitions
│   │   └── constants/       # Application constants
│   ├── package.json         # Frontend dependencies
│   └── tailwind.config.js   # TailwindCSS configuration
│
├── backend/                 # NestJS API server
│   ├── src/
│   │   ├── modules/         # Feature modules
│   │   │   └── common/      # Shared utilities and base classes
│   │   ├── db/              # Database related files
│   │   │   ├── migrations/  # TypeORM migrations
│   │   │   ├── seeders/     # Database seeders
│   │   │   └── entities/    # TypeORM entities
│   │   ├── config/          # Application configuration
│   │   ├── app.module.ts    # Main application module
│   │   ├── main.ts          # Application entry point
│   │   └── app.config.ts    # Configuration setup
│   └── package.json         # Backend dependencies
│
├── api-test/                # Integration/API tests
│   ├── src/                 # Test files
│   └── package.json         # Test dependencies
│
├── docker/                  # Docker configuration
│   └── local/               # Local development Dockerfiles
│       ├── Dockerfile.frontend
│       ├── Dockerfile.backend
│       └── Dockerfile.db-migration
│
├── scripts/                 # Utility scripts
│   └── reinstall.sh         # Reinstall all dependencies
│
├── docs/                    # Documentation files
├── docker-compose.yml       # Docker services configuration
├── Makefile                 # Development commands
├── .env.template            # Environment variables template
└── README.md               # This file
```

## 🚀 Quick Start

### Prerequisites

- **Node.js** (v18 or higher)
- **pnpm** (v8 or higher)
- **Docker** and **Docker Compose**
- **Make** (for running Makefile commands)

### 1. Clone and Setup

```bash
# Clone the repository
git clone <repository-url>
cd claim-submission-app

# Copy environment variables
cp .env.template .env

# Install all dependencies
make install
```

### 2. Environment Configuration

Edit the `.env` file with your preferred settings:

```bash
# Database Configuration
DATABASE_HOST=localhost
DATABASE_PORT=5432
DATABASE_USER=postgres
DATABASE_PASSWORD=Password1234
DATABASE_DB=project_db

# Application Ports
FRONTEND_PORT=3000
BACKEND_PORT=3001

# Backend Configuration
BACKEND_CLIENT_HOST=http://localhost:3000
FRONTEND_BACKEND_BASE_URL=http://localhost:3001
```

### 3. Start the Application

```bash
# Option 1: Start all services with Docker (Recommended)
make up/build

# Option 2: Start individual services
# Terminal 1 - Database
docker-compose up postgres

# Terminal 2 - Backend
cd backend && pnpm run dev

# Terminal 3 - Frontend
cd frontend && pnpm run dev
```

### 4. Access the Application

- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:3001
- **Database**: PostgreSQL on localhost:5432

## 🛠️ Development Workflow

### Common Commands

```bash
# Development
make up                # Start all services
make up/build          # Build and start all services
make down              # Stop all services

# Code Quality
make lint              # Lint all projects
make lint/fix          # Fix linting issues
make format            # Format all code

# Testing
make test/unit         # Run backend unit tests
make test/api          # Run API integration tests

# Database
make db/data/up        # Run database seeders
make db/data/reset     # Reset and reseed database
```

### Individual Service Commands

#### Frontend Development

```bash
cd frontend

pnpm run dev           # Start development server
pnpm run build         # Build for production
pnpm run lint          # Lint frontend code
pnpm run format        # Format code
```

#### Backend Development

```bash
cd backend

pnpm run dev           # Start development server with watch
pnpm run build         # Build TypeScript to JavaScript
pnpm run build:swc     # Build with SWC (faster)
pnpm run test          # Run unit tests
pnpm run lint          # Lint backend code

# Database Operations
pnpm run migration:generate --name=MigrationName
pnpm run migration:run
pnpm run seed:run
```

#### API Testing

```bash
cd api-test

pnpm run test          # Run all API tests
pnpm run test:watch    # Run tests in watch mode
```

## 🗄️ Database Management

### Migrations

```bash
# Generate a new migration
cd backend
pnpm run migration:generate --name=CreateUserTable

# Run migrations
pnpm run migration:run

# Revert last migration
pnpm run typeorm -- migration:revert
```

### Seeders

```bash
# Create a new seeder
pnpm run seed:create --name=UserSeeder

# Run all seeders
make db/data/up

# Reset database
make db/data/reset
```

## 🧪 Testing Strategy

### Backend Testing

- **Unit Tests**: Test individual services and utilities
- **Integration Tests**: Test database interactions
- Located in `backend/src/**/*.spec.ts`

### API Testing

- **End-to-End API Tests**: Test complete API workflows
- Located in `api-test/src/`
- Run with `make test/api`

### Frontend Testing

- Component testing setup ready for implementation
- Uses React Testing Library (to be configured)

## 📦 Key Technologies

### Frontend Stack

- **Next.js 15**: React framework with App Router
- **React 19**: UI library with latest features
- **TypeScript**: Type safety and developer experience
- **TailwindCSS v4**: Utility-first CSS framework
- **TanStack Query**: Server state management
- **Axios**: HTTP client for API requests

### Backend Stack

- **NestJS**: Progressive Node.js framework
- **TypeORM**: Object-relational mapping
- **PostgreSQL**: Primary database
- **Class Validator**: Request validation
- **Vitest**: Testing framework

### Development Tools

- **pnpm**: Fast, disk space efficient package manager
- **ESLint**: Code linting
- **Prettier**: Code formatting
- **Docker**: Containerization
- **Make**: Task automation

## 🔧 Configuration

### Environment Variables

| Variable                | Description               | Default            |
| ----------------------- | ------------------------- | ------------------ |
| `NODE_ENV`              | Application environment   | `local`            |
| `DATABASE_HOST`         | PostgreSQL host           | `localhost`        |
| `DATABASE_PORT`         | PostgreSQL port           | `5432`             |
| `DATABASE_USER`         | Database username         | `postgres`         |
| `DATABASE_PASSWORD`     | Database password         | `Password1234`     |
| `DATABASE_DB`           | Database name             | `project_db`       |
| `FRONTEND_PORT`         | Frontend application port | `3000`             |
| `BACKEND_PORT`          | Backend API port          | `3001`             |
| `BACKEND_COOKIE_SECRET` | Session cookie secret     | `something_secret` |

### Docker Services

The application uses Docker Compose with the following services:

- **postgres**: PostgreSQL 16 database
- **server**: NestJS backend application
- **client**: Next.js frontend application
- **db-migration-service**: Database migration runner

## 🤝 Contributing

1. **Create a feature branch**: `git checkout -b feature/your-feature`
2. **Follow code standards**: Run `make lint` and `make format`
3. **Write tests**: Add unit tests for backend changes
4. **Test your changes**: Run `make test/unit` and `make test/api`
5. **Submit a PR**: Include description of changes

### Code Standards

- **TypeScript**: Strict mode enabled, no `any` types
- **ESLint**: Configured for both frontend and backend
- **Prettier**: Consistent code formatting
- **Commit Messages**: Use conventional commit format

## 🐛 Troubleshooting

### Common Issues

**Port Already in Use**

```bash
# Kill processes on specific ports
lsof -ti:3000 | xargs kill -9  # Frontend
lsof -ti:3001 | xargs kill -9  # Backend
lsof -ti:5432 | xargs kill -9  # Database
```

**Database Connection Issues**

```bash
# Reset Docker volumes
make down/clean
make up/build
```

**Dependencies Issues**

```bash
# Reinstall all dependencies
make install
```

**Migration Errors**

```bash
# Reset database and run migrations
make db/data/reset
cd backend && pnpm run migration:run
```

### Getting Help

- Check the [CLAUDE.md](./CLAUDE.md) for development guidelines
- Review Docker logs: `docker-compose logs [service-name]`
- Check individual service logs in their respective directories
