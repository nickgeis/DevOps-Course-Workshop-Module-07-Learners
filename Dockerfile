FROM mcr.microsoft.com/dotnet/core/sdk:5.0 as build

# Install node
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash
RUN apt-get update && apt-get install -y nodejs

WORKDIR /workspace
