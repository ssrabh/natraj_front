# ---- Build stage ----
FROM ghcr.io/cirruslabs/flutter:stable AS build
WORKDIR /app

# Pre-fetch dependencies
COPY pubspec.* ./
RUN flutter pub get

# Copy source and build
COPY . .
RUN flutter build web --release

# ---- Serve stage ----
FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

