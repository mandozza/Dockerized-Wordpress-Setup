# Dockerized Wordpress Setup.

This Docker Compose setup includes the following services:

-   **MySQL Database**: A MySQL 5.7 instance.
-   **WordPress**: The latest version of WordPress connected to the MySQL instance.
-   **MailHog**: An email testing tool with a web and API interface.
-   **phpMyAdmin**: A web interface for managing the MySQL database.

## How to Use

### Accessing the Applications

1. **WordPress**: Visit [http://localhost:8000](http://localhost:8000)
2. **MailHog**: Access the web interface at [http://localhost:8025](http://localhost:8025)
3. **phpMyAdmin**: Manage the database at [http://localhost:8082](http://localhost:8082)

### Starting the Services

To start all services, use the following command:

docker-compose up -d

### Stopping the Services

To stop all services, use the following command:

docker-compose down

This command will stop and remove all the running containers.

## Docker Compose Configuration

-   **db (MySQL 5.7)**: This service uses a persistent volume `db_data` for storing the database.
-   **WordPress**: Configured to run on port 8000. It depends on the `db` service for its database.
-   **MailHog**: An email testing tool that runs on port 8025.
-   **phpMyAdmin**: Runs on port 8082 and provides a web interface for managing the MySQL database.

### Environment

The Docker Compose file is written using version 3.9.

## Customizing Localhost URL

You have the flexibility to customize the localhost URL for your project. Follow these steps to update the localhost URL:

1. Open your terminal.

2. Run the following command:

```
./update_site.sh
```

This script will update both your `/etc/hosts` file on your computer and the `docker-compose.yml` file to use the specified domain when accessing your WordPress site locally.

3. It's recommended to use `.test` domains when working on local development. You can replace the default localhost URL with your custom domain to make your local environment feel more like a live site.

Now, your WordPress site will be accessible using your custom domain, providing a more seamless local development experience.

## Configuration via .env File

This project allows you to configure WordPress variables using a `.env` file. This file is useful for customizing your local development environment and adjusting WordPress settings to your preferences. Here's how to use it:

1. **Create or Edit the .env File:** In the root directory of your project, you can create or edit a file named `.env`. This file should contain key-value pairs in the format `VARIABLE_NAME=value`. For example:

    ```dotenv
    WORDPRESS_DEBUG=true
    MY_CUSTOM_VARIABLE=custom_value
    ```

## Further Information

This setup is designed to provide a local development environment for WordPress with tools for email testing and database management. Ensure you have Docker and Docker Compose installed on your machine to utilize this setup.

**Note**: This is a development setup and should not be used in production. Always remember to manage and protect your passwords and other sensitive information properly.
Now you can simply copy and paste this markdown content into your README.md file.
