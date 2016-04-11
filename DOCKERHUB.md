# Supported tags and respective `Dockerfile` links
- [`next` (*Dockerfile*)](https://github.com/aheinze/cockpit-docker/blob/master/Dockerfile)
- [`0.13.0`,  `latest` (*Dockerfile*)](https://github.com/aheinze/cockpit-docker/blob/master/Dockerfile)

This repository is updated with automated builds through Travis.

# What is Cockpit?

The CMS for developers. Add content management functionality to any site - plug & play CMS. Manage content like collections, regions, forms and galleries which you can reuse anywhere on your website. Read more at http://getcockpit.com

![Cockpit](http://getcockpit.com/site/assets/images/teaser.png)

# How to use this image
Start a cockpit instance:

    docker run -d --name cockpit -p 8080:80 aheinze/cockpit

Follow the [setup instructions](http://getcockpit.com/docs#!getting_started/setup).

## Environment Variables

The Cockpit image uses non required environment variables for the database, email and others configs.

### `COCKPIT_SESSION_NAME`
The name of the cockpit session.

### `COCKPIT_SALT`
Salt for password hashing etc.

### `COCKPIT_I18N`
Default system language.

### `COCKPIT_DATABASE_SERVER`, `COCKPIT_DATABASE_NAME`
To use mongodb as main data storage.

### Email
You can configure email settings with the following variables:
```php
if (!empty(getenv('COCKPIT_MAILER_FROM'))){
  $configs['mailer'] = [
      "from"      => getenv('COCKPIT_MAILER_FROM'),
      "transport" => getenv('COCKPIT_MAILER_TRANSPORT'),
      "host"      => getenv('COCKPIT_MAILER_HOST'),
      "user"      => getenv('COCKPIT_MAILER_USER'),
      "password"  => getenv('COCKPIT_MAILER_PASSWORD'),
      "port"      => getenv('COCKPIT_MAILER_PORT'),
      "auth"      => getenv('COCKPIT_MAILER_AUTH'),
      "encryption"=> getenv('COCKPIT_MAILER_ENCRYPTION')
  ];
}
```

# How to extend this image
You can extend this image and add your custom **cockpit/custom/config.php** (in the `next` branch is config/config.php)

```
FROM aheinze/cockpit
COPY config.php /var/www/html/custom/config.php
```

# User Feedback
## Documentation
Documentation for this image is stored in the Github repository [README.md](https://github.com/aheinze/cockpit-docker)

## Issues
Submit your issues in [Github](https://github.com/aheinze/cockpit-docker/issues)
