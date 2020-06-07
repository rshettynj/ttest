Terraform top level module layout

tree
.
└── demo
    ├── examples
    ├── main.tf
    ├── modules
    │   └── my_s3
    │       ├── main.tf
    │       ├── outputs.tf
    │       ├── README.md
    │       └── variables.tf
    ├── outputs.tf
    ├── README.md
    ├── terraform.tfstate
    ├── terraform.tfstate.backup
    └── variables.tf

Root main.tf is commented as needed to explain the flow.

This is a quick layout and tutorial to show
1. How to organize terraform modules.
2. How to call child module from root(main) module.
3. How to use local, variables and pass them to child module.
4. How to get back child output values into root module.

All of this is explained by creating 2 s3 buckets.

You can construct more complex logic following these basics.


