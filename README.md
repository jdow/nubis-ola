# nubis-ola
#### How to build
1. Build AMI
    ```bash
    $ vim ./nubis/builder/project.json
    $ ./bin/build-ami.sh
    ```

2. Edit cloudformation parameters.json file
    ```bash
    $ cp ./nubis/cloudformation/parameters.json-dist ./nubis/cloudformation/parameters.json
    ```

3. Build cloudformation stack
    ```bash
    $ ./bin/create.sh okta-agent
    ```

#### Notes
* We depend on having consul secure to make this work, so we will need to get an ACL token. You can generate an ACL token using the `uuidgen` command

* With the ACL token you should make sure you pre-create a K/V folder for your stack, or make sure the ACL has some form of wild card in consul. Example:
```
key "okta*/" {
    policy = "write"
}
```
