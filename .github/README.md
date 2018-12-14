<p align="center">
    <img src="/.github/home-page-images/laradock-logo.jpg?raw=true" alt="Laradock Logo"/>
</p>

<p align="center">mCOP</p>

## MS SQL Server by docker

Windows run

> docker run --name mssqlserver -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=yourStrong(!)Password" -p 1433:1433 -d microsoft/mssql-server-linux:latest

OSX or Linux run

> docker run --name mssqlserver -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=yourStrong(!)Password' -p 1433:1433 -d microsoft/mssql-server-linux:latest

Other command
docker stop $(docker ps -a -q)
docker rm$(docker ps -a -q)
