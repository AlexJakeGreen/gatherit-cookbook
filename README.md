gatherit Cookbook

[![Code Climate](https://codeclimate.com/github/AlexJakeGreen/gatherit-cookbook/badges/gpa.svg)](https://codeclimate.com/github/AlexJakeGreen/gatherit-cookbook)

=================
Installs `gather` from https://github.com/trociny/gatherit

Requirements
------------

###Platforms:
- CentOS,
- Red Hat,
- Amazon Linux

###Chef
- Chef 11+

Usage
-----
Simply include the `gatherit` recipe where ever you would like `gather` installed

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[gatherit]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Alex Green
