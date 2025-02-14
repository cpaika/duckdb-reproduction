FROM ubuntu:22.04

# Install basic build dependencies
RUN apt-get update && \
  apt-get install -y \
  build-essential \
  curl

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

RUN . "$HOME/.cargo/env"

# Create a new directory for the Rust project
WORKDIR /app

# Copy minimal reproduction
COPY . .

RUN $HOME/.cargo/bin/rustup default stable

# This should fail from linking errors
RUN $HOME/.cargo/bin/cargo test
