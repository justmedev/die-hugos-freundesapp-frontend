# Die Hugos

an app to split bills for friends. It also includes some helpful friendgroup tools like a wheel of
names and some minigames.

# Environment Variables

can be set either by creating a .env or defining them by command line

| Name         | Purpose                                                          | Example Value                        |
|--------------|------------------------------------------------------------------|--------------------------------------|
| KC_CLIENTID  | The keycloak clientid                                            | die-hugos                            |
| KC_REALM     | The name of the realm                                            | https://my-keycloak/realms/die-hugos |
| API_BASE_URL | The url of the backend without a leading slash, can include port | https://my-diehugos-backend          |

# Keycloak

A keycloak instance is required, and a new realm with a clientid must be set up and input into the env
variables.
