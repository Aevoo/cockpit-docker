# Supported tags and respective `Dockerfile` links
- [`0.13.0`,  `latest` (*Dockerfile*)](https://github.com/aheinze/cockpit-docker/blob/master/Dockerfile)

This repository is updated with automated builds through Travis.

# What is Cockpit?

The CMS for developers. Add content management functionality to any site - plug & play CMS. Manage content like collections, regions, forms and galleries which you can reuse anywhere on your website. Read more at http://getcockpit.com

![Cockpit](http://getcockpit.com/site/assets/images/teaser.png)

# How to use this image
Start a cockpit instance:

    docker run -d --name cockpit -p 8080:80 aheinze/cockpit

Follow the [setup instructions](http://getcockpit.com/docs#!getting_started/setup).

# How to extend this image
You can extend this image and add your custom **cockpit/custom/config.php**

```
FROM aheinze/cockpit
COPY config.php /var/www/html/custom/config.php
```

# User Feedback
## Documentation
Documentation for this image is stored in the Github repository [README.md](https://github.com/aheinze/cockpit-docker)

## Issues
Submit your issues in [Github](https://github.com/aheinze/cockpit-docker/issues)
