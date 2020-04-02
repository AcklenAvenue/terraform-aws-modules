## Terraform Modules

In order to use this modules, you have to import them with the __source__ attribute like this:

```
provider "aws" {
  region     = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}

terraform {
  backend "s3" {
    bucket = <<YOUR_BUCKET_NAME_HERE>>
    region = <<YOUR_REGION_HERE>>
    key   = "my_project/"
  }
}

module "network-sprint-0" {
  source      = "AcklenAvenue/modules/aws//modules/network"
  vpc_cidr    = "172.16.0.0/16"
  name_prefix = "my_project"

  cidrs = {
    public1  = "172.16.1.0/24"
    public2  = "172.16.2.0/24"
    private1 = "172.16.3.0/24"
    private2 = "172.16.4.0/24"
    rds1     = "172.16.5.0/24"
    rds2     = "172.16.6.0/24"
  }
}
```

You can either import the root module (which connects all submodules in the repo), or import just one of the submodules
in the example above we imported just the `network` submodule.

If you don't specify the version, by default the latest one is downloaded.

Reference: [Terraform docs](https://www.terraform.io/docs/modules/sources.html)

### Usage

You need to assign values to all the variables the module needs _(unless they have a __default__ value)_. In the example above the __network module__ has variables called `name_prefix`, `vpc_cidr` and `cidrs`; assign them all.

Terraform basicly downloads the repo locally, so your _`$ Terraform init`_ won't work unless you have __git__ installed.

### Gitlab CI/CD

Here is an example of _gitlab-ci.yml_ file using the remote modules

```
stages:
  - deploy
  - destroy

create-infra:
  stage: deploy
  image: docker:stable
  services:
    - docker:dind
  before_script:
    - export AWS_SECRET_ACCESS_KEY=<<YOUR_KEYS_FOR_S3_BACKEND_HERE>>
    - export AWS_ACCESS_KEY_ID=<<YOUR_KEYS_FOR_S3_BACKEND_HERE>>
  script:
    - apk --update add terraform git
    - terraform init -upgrade
    - terraform apply -auto-approve

destroy-infra:
  stage: destroy
  image: docker:stable
  services:
    - docker:dind
  before_script:
    - export AWS_SECRET_ACCESS_KEY=<<YOUR_KEYS_FOR_S3_BACKEND_HERE>>
    - export AWS_ACCESS_KEY_ID=<<YOUR_KEYS_FOR_S3_BACKEND_HERE>>
  script:
    - apk --update add terraform git
    - terraform init -upgrade
    - terraform destroy -auto-approve
  when:
    manual
```

Notice that the job is assuming you are on the root directory of the __main.tf (its content is the same of the example above)__ file and the flag __-upgrade__ ensures that terraform will download the remote modules
