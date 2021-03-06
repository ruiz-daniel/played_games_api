# FROM mcr.microsoft.com/dotnet/aspnet:5.0
# COPY bin/Release/net5.0/publish/ DRG_API/
# WORKDIR /DRG_API
# EXPOSE 80
# ENTRYPOINT ["dotnet", "DRG_Api.dll"]

# syntax=docker/dockerfile:1
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
EXPOSE 5001
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "DRG_Api.dll"]