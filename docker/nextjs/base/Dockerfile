FROM node:18-alpine AS base

RUN apk add --no-cache libc6-compat

WORKDIR /app

# Install dependencies only when needed
FROM base AS deps

WORKDIR /app



