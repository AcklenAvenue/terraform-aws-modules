## Terraform Modules

In order to use this modules, you have to import them with the __source__ attribute like this:

```c
module "cloudwatch" {
  source      = "git::https://gitlab.com/ivandres73/terraform-modules.git//backend/modules/cloudwatch"
  name_prefix = var.name_prefix
}
```

Remeber to specify the folder where the _.tf_ files are inside the respository, in this case is `backend/modules/cloudwatch/`

Reference: [Terraform docs](https://www.terraform.io/docs/modules/sources.html)

### Usage

You need to assign values to all the variables the module needs _(unless they have a __default__ value)_. In the example above the __cloudwatch module__ has a variable called `name_prefix` and we assigned it with a local name_prefix var.

Terraform basicly downloads the repo locally, so your _`$ Terraform apply`_ won't work unless you have __git__ installed.

