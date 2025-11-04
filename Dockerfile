# Use the official Flutter image for web builds
FROM ghcr.io/cirruslabs/flutter:stable AS build

# Set working directory
WORKDIR /app

# Copy pubspec and get dependencies first (cache optimization)
COPY pubspec.* ./
RUN flutter pub get

# Copy the rest of the app
COPY . .

# Build the Flutter web app (release mode)
RUN flutter build web --release

# Use a lightweight web server to serve the built app
FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose port 80 for Render
EXPOSE 80

# Default command
CMD ["nginx", "-g", "daemon off;"]
