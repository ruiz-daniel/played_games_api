# FROM mcr.microsoft.com/dotnet/aspnet:5.0
# COPY bin/Release/net5.0/publish/ DRG_API/
# WORKDIR /DRG_API
# EXPOSE 80
# ENTRYPOINT ["dotnet", "DRG_Api.dll"]

# syntax=docker/dockerfile:1
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
WORKDIR /source

# Copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY . ./
WORKDIR /source/
RUN dotnet dev-certs https --trust
CMD ["dotnet", "run"]
EXPOSE 5001

# Build runtime image
# FROM mcr.microsoft.com/dotnet/aspnet:5.0
# WORKDIR /app
# COPY --from=build-env /app ./
# ENTRYPOINT ["dotnet", "DRG_Api.dll"]
# EXPOSE 5000