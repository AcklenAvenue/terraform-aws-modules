## Terraform Modules

In order to use this modules, you have to import them with the __source__ attribute like this:

```c
module "cloudwatch" {
  source      = "acklendeveloper/backend/aws//modules/security"
  name_prefix = var.name_prefix
}
```

You can either import the root module (which connects all submodules in the repo), or import just one of the submodules
in the example above we imported just the `security` submodule.

If you don't specify the version, by default the latest one is downloaded.

Reference: [Terraform docs](https://www.terraform.io/docs/modules/sources.html)

### Usage

You need to assign values to all the variables the module needs _(unless they have a __default__ value)_. In the example above the __security module__ has a variable called `name_prefix` and we assigned it with a local name_prefix var.

Terraform basicly downloads the repo locally, so your _`$ Terraform init`_ won't work unless you have __git__ installed.

### Gitlab CI/CD

Here is an example of a job in gitlab using the remote modules

```c
create-infra:
  stage: deploy
  script:
    - apk --update add terraform git awscli
    - terraform init -upgrade
    - terrafrom apply -auto-approve
```

Notice that the job is assuming you are on the root directory of the __main.tf__ file and the flag __-upgrade__ ensures that terraform will download the remote modules