FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as builder

WORKDIR /src
COPY ./src ./
RUN mkdir /build
RUN dotnet publish -o /build -r linux-x64


FROM mcr.microsoft.com/dotnet/core/aspnet:3.1

RUN adduser --disabled-password --home /app --gecos '' app
WORKDIR /app
RUN chown -R app /app
COPY --from=builder /build .

ARG run_environment=Production
ENV ASPNETCORE_ENVIRONMENT ${run_environment}
ENV DOTNET_RUNNING_IN_CONTAINER=true \
	ASPNETCORE_URLS=http://+:8080

EXPOSE 8080
ENTRYPOINT ["dotnet", "BaseWebApp.dll"]

