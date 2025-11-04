# Use official Flutter image
FROM ghcr.io/cirruslabs/flutter:stable AS build

WORKDIR /app

# Copy dependency files and install packages
COPY pubspec.* ./
RUN flutter pub get

# Copy rest of the app
COPY . .

# Build Flutter web app
RUN flutter build web --release

# Serve via nginx
FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
