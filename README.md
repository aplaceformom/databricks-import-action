Databricks import action
========================

This [GitHub Action][GitHub Actions] allows performing the equivilant of
`databricks workspace import_dir --overwrite` against a source directory.

This action expects the Databricks workspace to already exist.

See also:
- https://help.github.com/en/actions
- https://github.com/apfm-actions

Usage
-----

### Executing an existing task
```yaml
  - name: Databricks Import
    uses: docker://apfm/databricks-action:latest
    with:
      host: https://my.databricks.instance
      username: mydatabricksuser
      token: ${{ secrets.DATABRICKS_TOKEN }}
```

Inputs
------

### host
Databricks host.
- required: `true`

### username
Databricks username.
- required: `false`

### token
Databricks personal access token.
- See also: https://docs.databricks.com/dev-tools/api/latest/authentication.html
- required: `true`

### source
Location of source for import.
- required: `false`
- default: `./src`

### workspace
Databricks workspace. If not provided then a workspace will be decided based on the git object reference.
- required: `false`

### debug ###
Enable debugging
- required: `false`
- default: `false`

[//]: # (The following are reference links used elsewhere in the document)

[Git]: https://git-scm.com/
[GitHub]: https://www.github.com
[GitHub Actions]: https://help.github.com/en/actions
[Terraform]: https://www.terraform.io/
[Docker]: https://www.docker.com
[Dockerfile]: https://docs.docker.com/engine/reference/builder/
