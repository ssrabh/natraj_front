# Use the official Flutter image
FROM cirrusci/flutter:stable

# Set working directory
WORKDIR /app

# Copy everything
COPY . .

# Enable Flutter Web
RUN flutter config --enable-web

# Get dependencies and build release version
RUN flutter pub get
RUN flutter build web --release

# Expose the web server port
EXPOSE 8080

# Serve the built web app using a simple HTTP server
CMD ["bash", "-c", "cd build/web && python3 -m http.server 8080"]
