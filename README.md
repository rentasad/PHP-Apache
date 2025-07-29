# PHP-Apache with the following extensions: 
- mysqli and 
- intl
- pdo_mysql

it will be build to gustinimst/php8-apache:x.y

- **DockerBuildAndPush.ps1**: A PowerShell script to build and push the Docker image on Windows environments.
- **DockerBuildAndPush.sh**: A Bash script to build and push the Docker image on Unix-based environments.

## Usage

### PowerShell (Windows)

1. Open PowerShell.
2. Navigate to the project directory.
3. Run the script to build and push the Docker image:
```powershell
   ./DockerBuildAndPush.ps1
   
Latest Release:
    gustinimst/php8-apache:1.4
